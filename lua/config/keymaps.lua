-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 普通模式和命令模式下按 \ 保存文件
vim.keymap.set({ "n", "c" }, "\\", "<cmd>noa w<cr>", { noremap = true, silent = true, desc = "Save file" })
