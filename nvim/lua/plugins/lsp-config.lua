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
      --     filetypes = { 'javascriptreact', 'javascript' },
      --     preferences = {
      --       disableSuggestions = true,
      --     }
      --   }
      -- })

      local status = pcall(require, "lspconfig")
      if (not status) then return end


      lspconfig.tsserver.setup({
        capabilities = capabilities,
        -- recuerda que borraste el package.json de la lista por errores de nvim que molestan la visual al abrir un archivo .json
        root_pattern = { "tsconfig.json", "jsconfig.json", ".git" },
        init_options = {
          cmd = { "typescript-language-server", "--stdio" },

          filetypes = { "astro","javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          preferences = {
            disableSuggestions = true,
          },
        },

      })

      -- Configuración de eslint
      -- lspconfig.eslint.setup({
      --   capabilities = capabilities,
      -- })



      -- lspconfig.mdx_ls.setup({
      --   capabilities = capabilities,
      --   init_options = {
      --     filetypes = { 'astro' },
      --     preferences = {
      --       disableSuggestions = false,
      --     }
      --   }
      -- })
      --
      --
      -- lspconfig.astro_ls.setup({
      --   capabilities = capabilities,
      --   cmd = { "astro-language-server", "--stdio" },
      --   filetypes = { "astro" },
      --   root_dir = lspconfig.util.root_pattern(".git", "package.json", "astro.config.*"),
      --   settings = {},
      -- })

      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "jsx", "javascriptreact", "tsx", 'typescriptreact', "astro" }
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "astro", "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
      })

      -- lspconfig.sqlls.setup({
      --   capabilities = capabilities,
      --   filetypes = { 'sql', 'mysql' },
      -- })

      -- Configuración de markdown con marksman
      lspconfig.marksman.setup({
        capabilities = capabilities,
        filetypes = { "markdown" },
        root_dir = lspconfig.util.root_pattern(".git", "README.md"),
      })

      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
