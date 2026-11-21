-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 按 \ 保存文件；只读文件（如 /etc 下的配置）自动提权写入，保留原文件权限与所有者
local function save()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" or vim.fn.filewritable(file) == 1 then
    vim.cmd("noa w")
    return
  end
  if vim.fn.filereadable(file) == 0 then
    vim.notify("文件不可读，请用 sudo -e " .. file .. " 打开", vim.log.levels.WARN)
    return
  end
  vim.cmd("write !sudo tee " .. vim.fn.shellescape(file) .. " > /dev/null")
  if vim.v.shell_error == 0 then
    vim.cmd("noa edit!")
  else
    vim.notify("sudo 保存失败（密码错误或已取消）", vim.log.levels.ERROR)
  end
end

vim.keymap.set({ "n", "c" }, "\\", function()
  if vim.fn.getcmdtype() ~= "" then
    -- 命令行模式下先退出再保存，否则 nvim_command 不允许执行
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    vim.schedule(save)
  else
    save()
  end
end, { noremap = true, silent = true, desc = "Save file (sudo if read-only)" })
