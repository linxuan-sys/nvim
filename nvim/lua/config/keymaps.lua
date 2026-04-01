-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 全局切换拼写检查开关（任何文件类型都有效）
vim.keymap.set("n", "<leader>m", function()
  vim.opt.spell = not vim.opt.spell:get()
  if vim.opt.spell:get() then
    print("Spell check enabled")
  else
    print("Spell check disabled")
  end
end, { desc = "Toggle Spell Check" })
