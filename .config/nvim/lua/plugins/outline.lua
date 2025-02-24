return {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<C-a>", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
      providers = {
        priority = { "lsp", "treesitter", "coc", "markdown", "norg", "man" },
      },
      outline_window = {
        width = 20,
      },
    }
  end,
}
