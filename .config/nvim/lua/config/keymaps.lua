-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Support mouse navigation
vim.keymap.set("n", "<m-leftmouse>", "<leftmouse>:DefinitionOrReferences<cr>", { noremap = true, silent = true })
vim.api.nvim_create_user_command("DefinitionOrReferences", function()
  -- 保存当前光标位置
  local save_pos = vim.fn.getpos(".")

  -- 尝试 gd
  vim.cmd("normal gd")

  -- 延迟检测光标是否移动（确保 gd 完成）
  vim.defer_fn(function()
    local current_pos = vim.fn.getpos(".")
    if save_pos[1] == current_pos[1] and save_pos[2] == current_pos[2] and save_pos[3] == current_pos[3] then
      -- gd 失败，执行 gr
      vim.cmd("normal gr")
    end
  end, 100) -- 延迟 100ms
end, {})

-- Scroll one line at a time
vim.keymap.set("n", "<scrollwheelup>", "<c-y>", { noremap = true, silent = true })
vim.keymap.set("n", "<scrollwheeldown>", "<c-e>", { noremap = true, silent = true })
