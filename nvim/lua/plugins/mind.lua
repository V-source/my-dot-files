return {
  "Selyss/mind.nvim",
  branch = 'v2.2',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, used for icons
  },
  opts = {
    -- your configuration comes here
  },

  vim.keymap.set('n', "<leader>om",":MindOpenMain<CR>", {silent=true}),
  vim.keymap.set('n', "<leader>xm",":MindClose<CR>", {silent=true}),

}
