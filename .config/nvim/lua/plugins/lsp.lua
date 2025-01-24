return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Define on_attach function
      local on_attach = function(client, bufnr)
        -- Define buffer-local keybindings for LSP
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

        -- LSP settings
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end, { desc = "Format the current buffer" })
        end
      end

      -- Automatically setup LSP servers for all installed servers
      local handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      }

      -- Setup handlers for installing LSP servers
      mason_lspconfig.setup_handlers(handlers)
    end,
  },
}

