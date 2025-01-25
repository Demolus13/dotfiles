-- Tabs and Indentations
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

-- Enable absolute line numbers
vim.opt.number = true

-- Set keymap
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window managements
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.keymap.set("n", "<C-w>h", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-w>x", "<cmd>close<CR>", { desc = "Close the current split" })

-- Tabs managements
vim.keymap.set("n", "<C-t>o", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<C-t>x", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
vim.keymap.set("n", "<C-t>n", "<cmd>tabn<CR>", { desc = "Go to the next tab" })
vim.keymap.set("n", "<C-t>p", "<cmd>tabp<CR>", { desc = "Go to the previous tab" })
vim.keymap.set("n", "<C-t>f", "<cmd>tabnew %<CR>", { desc = "Open the current buffer in a new tab" })

-- Load the package manager lazy.nvim
require("config.lazy")
