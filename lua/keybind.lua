local nore_silent = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "j", "gj", nore_silent)
keymap("n", "k", "gk", nore_silent)
keymap("n", "gj", "j", nore_silent)
keymap("n", "gk", "k", nore_silent)
keymap("v", "j", "gj", nore_silent)
keymap("v", "k", "gk", nore_silent)
keymap("v", "gj", "j", nore_silent)
keymap("v", "gk", "k", nore_silent)

keymap("i", "<C-a>", "<C-o>0", nore_silent)
keymap("i", "<C-e>", "<C-o>$", nore_silent)

keymap("n", "t", "gt", nore_silent)
keymap("n", "T", "gT", nore_silent)

keymap("n", "*", [[:<C-u>let @/="\\<<C-r><C-w>\\>" | set hls<CR>]], nore_silent)

-- Other remappable strokes in normal mode:
-- +
-- !
-- #
-- &
-- -
-- (
-- )
-- '
-- S
-- X
-- U
keymap("n", "Q", "<Nop>", nore_silent)
-- K
-- R
-- C-g
-- C-h
-- C-j
-- C-m
-- C-n

keymap("", "<Space>", "<Nop>", nore_silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "