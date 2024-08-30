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
      enable_git_status = true,
      filesystem = {
        use_libuv_file_watcher = true,
        hidden_files = {
          enabled = true,
          list = { 'node_modules/**/.*' }
        }
      },
      window = {
        width = 30,
        position = "float",
      },
    })


    -- NeoTree keymap
    vim.keymap.set('n', '<leader>;', ':Neotree filesystem reveal left <CR>', { silent = true })
    vim.keymap.set('n', "<leader>'", ':Neotree filesystem focus toggle=true <CR>', { silent = true })
    -- vim.keymap.set('n', "<leader>;", ":Neotree toggle float<CR>", { silent = true, desc = "Float File Explorer" })
    -- vim.keymap.set('n', '<leader>;', ':Neotree filesystem focus toggle=true <CR>', { silent = true })
    -- vim.keymap.set('n', '<C-n>r', ':Neotree filesystem reveal right <CR>', {silent = true})
  end
}

