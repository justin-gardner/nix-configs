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

-- obsidian
keymap("n", "<leader>oo", ":cd ~/apps/obsidian_vaults<cr>", { desc = "Go to obsidian vault" })
keymap("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>", { desc = "Use note template" })
keymap("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "Format title line" })
keymap("n", "<leader>os", ":Telescope find_files search_dirs={\"~/apps/obsidian_vaults/notes/\"}<cr>", { desc = "Find files" })
keymap("n", "<leader>oz", ":Telescope live_grep search_dirs={\"~/apps/obsidian_vaults/notes/\"}<cr>", { desc = "Grep files" })

-- insert mode
keymap("i", "jk", "<ESC>", opts) -- easier escape
