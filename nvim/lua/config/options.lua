-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 全局禁用拼写检查（默认关闭，可用快捷键切换）
vim.opt.spell = false

-- 1. 禁用注释自动延续（按回车后下一行不自动继承注释）
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- 2. 允许左右方向键换行
vim.opt.whichwrap:append("<,>,h,l")
