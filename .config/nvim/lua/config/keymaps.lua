-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- support mouse navigation
map("n", "<m-leftmouse>", "<leftmouse>gd", { desc = "Goto Definition", remap = true })
map("n", "<m-rightmouse>", "<leftmouse>gr", { desc = "References", remap = true })
