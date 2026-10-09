-- HTML 浏览器实时预览（无需保存）
-- 依赖 ~/.config/nvim/scripts/html_preview.py
-- 用法：在 .html/.htm 里执行 :HtmlPreview，浏览器打开后边打字边看（停约 50ms 即刷新）

local script = vim.fn.stdpath("config") .. "/scripts/html_preview.py"

local function port_for(file)
  local n = tonumber(vim.fn.sha256(file):sub(1, 8), 16) or 0
  return 9100 + (n % 200)
end

local function html_preview()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)

  if file == "" then
    vim.notify("当前缓冲区还没有对应文件", vim.log.levels.WARN)
    return
  end
  if not file:lower():match("%.html?$") then
    vim.notify("只支持 .html / .htm 文件", vim.log.levels.WARN)
    return
  end
  if vim.fn.executable("python3") ~= 1 then
    vim.notify("找不到 python3", vim.log.levels.ERROR)
    return
  end

  local port = port_for(file)
  local url = ("http://127.0.0.1:%d/__update"):format(port)

  -- 分离式启动预览服务
  vim.system({ "python3", script, file, "--port", tostring(port) }, { detach = true })

  -- 打字后仅防抖 50ms，就把整个 buffer 推给服务（无需保存）
  local group = vim.api.nvim_create_augroup("HtmlPreview_" .. buf, { clear = true })
  local timer = vim.uv.new_timer()
  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = group,
    buffer = buf,
    callback = function()
      timer:stop()
      timer:start(
        50,
        0,
        vim.schedule_wrap(function()
          if not (vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf)) then
            return
          end
          local body = table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n")
          vim.system({ "curl", "-s", "-X", "POST", "--data-binary", "@-", url }, { stdin = body })
        end)
      )
    end,
  })

  vim.notify("html实时预览已启动", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("HtmlPreview", html_preview, {
  desc = "浏览器实时预览当前 HTML",
})
