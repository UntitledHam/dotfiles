-- Vim Options -- 
---------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.wo.relativenumber = true
vim.cmd("set nowrap")

-- Yank to clipboard using wlcopy
vim.o.clipboard = "unnamedplus"

-- Map <leader>y to yank and <leader>p to paste
vim.api.nvim_set_keymap('n', '<leader>y', ':w !wlcopy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', ':w !wlcopy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':r !wlpaste<CR><CR>', { noremap = true, silent = true })

