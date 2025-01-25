return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
  config = function()
		require("Comment").setup({
			padding = true, -- Optional: Add padding around the comment
			sticky = true, -- Optional: Keep comments aligned
			ignore = nil, -- Optional: Define which filetypes to ignore
			mappings = {
				basic = true,
				extra = false,
				extended = false,
			},
		})

		-- Override keybindings for VS Code-like experience
		vim.api.nvim_set_keymap(
			"n",
			"<C-/>",
			'<CMD>lua require("Comment.api").toggle.linewise.current()<CR>',
			{ noremap = true, silent = true }
		) -- Toggle comment for the current line

		-- Block comment
		vim.api.nvim_set_keymap(
			"n",
			"<C-\\>",
			'<CMD>lua require("Comment.api").toggle.blockwise.current()<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
