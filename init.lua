-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 切换 buffer / 失焦时自动保存
vim.opt.autowriteall = true

-- HTML 浏览器实时预览（:HtmlPreview）
require("config.html_preview")
