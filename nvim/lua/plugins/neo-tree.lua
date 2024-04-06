return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hidden_files = {
          enabled = true,
          list = { 'node_modules/**/.*' }
        }
      },
      window = {
        width = 30
      },
    })
    -- NeoTree keymap
    vim.keymap.set('n', '<C-n>l', ':Neotree filesystem reveal left <CR>', { silent = true })
    vim.keymap.set('n', '<C-n>f', ':Neotree filesystem focus toggle=true <CR>', { silent = true })
    -- vim.keymap.set('n', '<C-n>r', ':Neotree filesystem reveal right <CR>', {silent = true})
  end
}
