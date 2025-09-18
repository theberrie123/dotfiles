local keymap = vim.keymap.set
local opts = {
        noremap = true,
        silent = true
}
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
