-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- normal mode
-- navigation
keymap("n", "^", "<nop>", opts)
keymap("n", "$", "<nop>", opts)
keymap("n", "B", "^", opts)
keymap("n", "E", "$", opts)

-- insert mode
keymap("i", "jk", "<ESC>", opts) -- easier escape
