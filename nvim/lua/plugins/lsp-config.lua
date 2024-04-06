-- return {}
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
    otps = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- optimizacion del plugin
      -- esto evita que se cuelgue la pc
      local capabilities = vim.tbl_deep_extend("force",
        vim.lsp.protocol.make_client_capabilities(),
        -- esto por si solo causa que se cuelgue la pc
        require("cmp_nvim_lsp").default_capabilities()
      )
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false -- esto evita que se cuelgue
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- lspconfig.vtsls.setup({
      --   capabilities = capabilities,
      --
      --   init_options = {
      --     filetypes = { 'javascriptreact' },
      --     preferences = {
      --       disableSuggestions = true,
      --     }
      --   }
      -- })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        init_options = {
          filetypes = { 'javascriptreact', 'astro' },
          preferences = {
            disableSuggestions = true,
          }
        }
      })

      lspconfig.astro_ls.setup({
        capabilities = capabilities,
        init_options = {
          filetypes = { 'astro' },
          preferences = {
            disableSuggestions = false,
          }
        }
      })

      -- lspconfig.mdx_ls.setup({
      --   capabilities = capabilities,
      --   init_options = {
      --     filetypes = { 'astro' },
      --     preferences = {
      --       disableSuggestions = false,
      --     }
      --   }
      -- })

      -- lspconfig.astro_ls.setup({
      --   capabilities = capabilities,
      --   cmd = { "astro-language-server", "--stdio" },
      --   filetypes = { "astro" },
      --   root_dir = lspconfig.util.root_pattern(".git", "package.json"),
      --   settings = {},
      -- })

      -- lspconfig.html.setup({
      --   capabilities = capabilities,
      --   filetypes = {"html", "jsx", "javascriptreact"}
      -- })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { 'css', 'html', "javascriptreact", "astro" },
      })

      lspconfig.sqlls.setup({
        capabilities = capabilities,
        filetypes = { 'sql', 'mysql' },
      })

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
