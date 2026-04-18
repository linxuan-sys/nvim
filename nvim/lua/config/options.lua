-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python LSP: 使用 basedpyright（支持 inlay hints）代替 pyright
vim.g.lazyvim_python_lsp = "basedpyright"

-- 默认关闭 inlay hints，可用 <leader>uh 切换
-- vim.g.lazyvim_inlay_hints = false

-- 全局禁用拼写检查（默认关闭，可用快捷键切换）
vim.opt.spell = false

-- 1. 禁用注释自动延续（按回车后下一行不自动继承注释）
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- 2. 允许左右方向键换行
vim.opt.whichwrap:append("<,>,h,l")

-- 3. 默认开启自动换行（行太长时自动折到下一行显示）
vim.opt.wrap = true

-- 光标离上下边框最少1行，改成0就是完全贴边
vim.opt.scrolloff = 2
