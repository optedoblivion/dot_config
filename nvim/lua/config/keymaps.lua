-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- AI Strikes
map({ "n", "v" }, "<leader>mc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Mono Chat" })
map({ "n", "v" }, "<leader>ma", "<cmd>CodeCompanion<cr>", { desc = "Mono Action" })

-- Filesystem Strike
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Rapid Escape
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
