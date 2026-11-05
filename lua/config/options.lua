-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python LSP: 使用 basedpyright 代替 pyright
vim.g.lazyvim_python_lsp = "basedpyright"

-- 默认关闭报错功能
vim.diagnostic.enable(false)
