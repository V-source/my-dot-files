return {
  'folke/twilight.nvim',
  opts = {
    dimming = {
      alpha = 0.35,
      color = {"normal", "#ffffff"},
      term_bg = "#000000",
      inactive = true,

    },
    context = 40,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {}
  },
  -- vim.keymap.set('n', '<leader>zen', '<cmd>Twilight<CR>',{silent = true})
}
