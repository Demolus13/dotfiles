return {
  'nvim-treesitter/nvim-treesitter',  -- Treesitter plugin
  run = ':TSUpdate',                  -- Run TSUpdate after installation
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "c", "cpp", "python", "rust" },     -- Install the parsers
      highlight = {
        enable = true,                  -- Enable Tree-sitter syntax highlighting
      },
      indent = {
        enable = true,                  -- Enable Tree-sitter-based indentation
      },
    }
  end,
}

