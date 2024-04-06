return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function ()
    end,
  },

  {
    "hrsh7th/nvim-cmp",

    config = function()
      local cmp = require("cmp")
      local luasnip = require('luasnip')
      require('user.snippets')

      require("luasnip.loaders.from_vscode").lazy_load() -- edited
      -- require("luasnip.loaders.from_snipmate").lazy_load()

      cmp.setup({
        experimental = {
          ghost_text = false,
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users. --edited
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),    --edited
          documentation = cmp.config.window.bordered(), --edited
        },
        mapping = cmp.mapping.preset.insert({
          -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-\\>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          -- los siguientes mappings los encontré en:
          -- https://vonheikemen.github.io/devlog/es/tools/setup-nvim-lspconfig-plus-nvim-cmp/
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, --edited
          { name = "luasnip" },  -- For luasnip users.
          -- { name = "vsnip" },  -- For luasnip users.
          { name = "buffer" },   --edited
          { name = "path" },     --edited
        }),
      })
    end,
  }
}


-- return {
--   {
--     "hrsh7th/cmp-nvim-lsp"
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     dependencies = {
--       "saadparwaiz1/cmp_luasnip",
--       "rafamadriz/friendly-snippets",
--     },
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     config = function()
--       local cmp = require("cmp")
--       require("luasnip.loaders.from_vscode").lazy_load()
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--           end,
--         },
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "luasnip" }, -- For luasnip users.
--         }, {
--           { name = "buffer" },
--         }),
--       })
--     end,
--   },
-- }
