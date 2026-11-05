-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 删除 LazyVim 自动启用拼写检查的 autocmd
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- fcitx5 状态切换与恢复 (来自 shorin-arch-setup 99-apps.sh 的 LazyVim 配置)
local fcitx_st = ""
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    fcitx_st = vim.fn.system("fcitx5-remote")
    vim.fn.jobstart("fcitx5-remote -c")
  end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if fcitx_st:match("2") then
      vim.fn.jobstart("fcitx5-remote -o")
    end
  end,
})
-- 启动时直接切英文
vim.fn.jobstart("fcitx5-remote -c")
