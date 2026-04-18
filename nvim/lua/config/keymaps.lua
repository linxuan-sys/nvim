-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 快速按两次 p 相当于 Esc（插入模式和可视模式）
vim.keymap.set({ "i", "v" }, "pp", "<Esc>", { noremap = true, silent = true, desc = "Fast pp to Esc" })

-- 普通模式和命令模式下按 \ 保存文件
vim.keymap.set({ "n", "c" }, "\\", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
