return {
  'folke/twilight.nvim',
  opts = {
    dimming = {
      alpha = 0.25,
      color = {"normal", "#ffffff"},
      term_bg = "#000000",
      inactive = false,

    },
    context = 10,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {}
  },
  vim.keymap.set('n', '<leader>focus', '<cmd>Twilight<CR>',{silent = true})
}
