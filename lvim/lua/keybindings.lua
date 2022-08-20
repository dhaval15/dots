vim.g.mapleader = " "

local opt = {
  noremap = true,
  silent = true,
}

local map = vim.api.nvim_set_keymap

map("n", "<TAB>", ":bnext<CR>", opt)
map("n", "<S-TAB>", ":bprevious<CR>", opt)
