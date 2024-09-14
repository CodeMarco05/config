vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true, silent = true })
