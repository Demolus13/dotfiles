return {
  {
    "folke/tokyonight.nvim",       -- Tokyonight theme
    lazy = false,                  -- Load immediately
    priority = 1000,               -- Load before other plugins
    opts = {
      style = "night",             -- Select "storm", "moon", "night", or "day"
      transparent = false,         -- No transparency
    },
    config = function()
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
      
      -- Set the background color
      vim.api.nvim_set_hl(0, "Normal", { bg = "#0D1017" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0D1017" })
    end,
  },
}

