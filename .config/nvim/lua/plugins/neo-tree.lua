return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- Use the latest v3.x branch
	dependencies = {
		"nvim-lua/plenary.nvim", -- Necessary dependency
		"nvim-tree/nvim-web-devicons", -- File icons, recommended but optional
		"MunifTanjim/nui.nvim", -- UI components
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
				},
        components = {
            name = function(config, node, state)
                local components = require('neo-tree.sources.common.components')
                local name = components.name(config, node, state)
                if node:get_depth() == 1 then
                    name.text = vim.fs.basename(vim.loop.cwd() or '')
                end
                return name
            end,
        },
			},
			window = {
				width = 30, -- Set the width of the file explorer
				position = "left", -- Position on the left side of the screen
			},
		})

		-- Set custom background color for Neo-tree window
		-- vim.cmd([[highlight NeoTreeNormal guibg=#0D1017]])

		-- Keybinding
		vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")
	end,
}
