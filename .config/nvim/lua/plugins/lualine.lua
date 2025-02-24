-- lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  event = "BufRead", -- Load lualine when a buffer is opened
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- Set the theme for the statusline (you can change it)
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "neo-tree", "packer", "Outline" }, -- Disable lualine in specific filetypes
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", "filetype" },
        lualine_x = { "encoding", "fileformat", "location" },
        lualine_y = { "progress" },
        lualine_z = { "time" },
      },
      extensions = { "fugitive", "nvim-tree", "neo-tree" }, -- Optional: Add extra extensions like fugitive, nvim-tree
    })
  end,
}
