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
vim.keymap.set("n", "<C-Up>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<C-Down>", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
vim.keymap.set("n", "<C-Right>", "<cmd>tabn<CR>", { desc = "Go to the next tab" })
vim.keymap.set("n", "<C-Left>", "<cmd>tabp<CR>", { desc = "Go to the previous tab" })
vim.keymap.set("n", "<C-t>f", "<cmd>tabnew %<CR>", { desc = "Open the current buffer in a new tab" })

-- Changing keymaps
local function bind(op, outer_opts)
	outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local nnoremap = bind("n")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("gd", "gdzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)
nnoremap("U", "<C-r>")
nnoremap("<leader>no", "<cmd>noh<CR>")

-- Load the package manager lazy.nvim
require("config.lazy")
