#!/usr/bin/env python3
"""nvim 浏览器 HTML 实时预览（无需保存）。

用法:
    python3 html_preview.py <file.html> [--port N]

原理:
    本地 HTTP 伺服 HTML 所在目录（相对引用的 css/js/图片都能加载）。
    内容由 nvim 通过 POST /__update 实时推送；浏览器每 80ms 轮询 /__version，
    一有变化立即刷新。因此「边打字边看」无需先保存。

端点:
    GET  /            当前 HTML（注入自动刷新脚本）
    GET  /__version   当前版本号（内容一变就 +1）
    POST /__update    用请求体替换当前内容（nvim 调用）
    其它路径           从 HTML 所在目录伺服
"""
import mimetypes
import os
import subprocess
import sys
import threading
import time
import zlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

PORT = 0
HTML = ""

_args = list(sys.argv[1:])
if "--port" in _args:
    _i = _args.index("--port")
    PORT = int(_args[_i + 1])
    del _args[_i : _i + 2]
if _args:
    HTML = os.path.abspath(_args[0])
ROOT = os.path.dirname(HTML) or "."

if PORT == 0:
    PORT = 8700 + (zlib.crc32(HTML.encode()) % 300)

MIME_EXTRA = {
    ".woff2": "font/woff2",
    ".woff": "font/woff",
    ".ttf": "font/ttf",
    ".css": "text/css; charset=utf-8",
    ".js": "text/javascript; charset=utf-8",
    ".mjs": "text/javascript; charset=utf-8",
    ".json": "application/json; charset=utf-8",
    ".svg": "image/svg+xml",
    ".wasm": "application/wasm",
}

AUTORELOAD = """<script>
(function () {
  var last = null;
  setInterval(function () {
    fetch('/__version', { cache: 'no-store' })
      .then(function (r) { return r.text(); })
      .then(function (t) {
        if (last !== null && last !== t) { location.reload(); }
        last = t;
      })
      .catch(function () {});
  }, 80);
})();
</script>
"""

# content=None 表示"还没被推送过"，此时从磁盘读
STATE = {"content": None, "version": 0}


def read_file():
    try:
        with open(HTML, "r", encoding="utf-8", errors="replace") as f:
            return f.read()
    except OSError:
        return "<html><body><pre>File not found: %s</pre></body></html>" % HTML


def build_html():
    html = STATE["content"]
    if html is None:
        html = read_file()
    if "</body>" in html:
        html = html.replace("</body>", AUTORELOAD + "</body>", 1)
    else:
        html += AUTORELOAD
    return html


class Handler(BaseHTTPRequestHandler):
    def _send(self, code, body, ctype="text/html; charset=utf-8"):
        if isinstance(body, str):
            body = body.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(body)

    def _serve_file(self, rel):
        root = os.path.abspath(ROOT)
        full = os.path.abspath(os.path.join(root, rel))
        if not full.startswith(root + os.sep) or not os.path.isfile(full):
            return self._send(404, "not found", "text/plain")
        ext = os.path.splitext(full)[1].lower()
        ctype = MIME_EXTRA.get(ext) or mimetypes.guess_type(full)[0] \
            or "application/octet-stream"
        with open(full, "rb") as f:
            self._send(200, f.read(), ctype)

    def do_GET(self):
        path = self.path.split("?", 1)[0]
        if path in ("/", "/index.html", "/" + os.path.basename(HTML)):
            return self._send(200, build_html())
        if path == "/__version":
            return self._send(200, str(STATE["version"]), "text/plain")
        return self._serve_file(path.lstrip("/"))

    def do_POST(self):
        if self.path.split("?", 1)[0] == "/__update":
            length = int(self.headers.get("Content-Length", 0))
            body = self.rfile.read(length) if length else b""
            STATE["content"] = body.decode("utf-8", "replace")
            STATE["version"] += 1
            return self._send(200, "ok", "text/plain")
        return self._send(404, "not found", "text/plain")

    def log_message(self, *args):
        pass


def open_browser(url):
    for cmd in (["xdg-open", url], ["gio", "open", url], ["open", url]):
        try:
            subprocess.Popen(
                cmd,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                stdin=subprocess.DEVNULL,
                start_new_session=True,
            )
            return
        except FileNotFoundError:
            continue


def main():
    if not HTML or not os.path.isfile(HTML):
        print("usage: html_preview.py <file.html> [--port N]", file=sys.stderr)
        sys.exit(1)
    if HTML.lower().rsplit(".", 1)[-1] not in ("html", "htm"):
        print("not an html file: %s" % HTML, file=sys.stderr)
        sys.exit(1)

    url = "http://127.0.0.1:%d/" % PORT
    try:
        httpd = ThreadingHTTPServer(("127.0.0.1", PORT), Handler)
    except OSError:
        # 端口被占用 = 该文件的预览服务大概率已在运行，直接开浏览器即可
        open_browser(url)
        return

    threading.Thread(
        target=lambda: (time.sleep(0.5), open_browser(url)), daemon=True
    ).start()
    print("html preview: %s -> %s" % (HTML, url), flush=True)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
