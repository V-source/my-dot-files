return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', 'jonarrien/telescope-cmdline.nvim', },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { "node_modules/*" },
          preview = {
            treesitter = false,
          },
        },
      })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      -- vim.keymap.set('n', ':', ':Telescope cmdline <CR>', { desc = 'Cmdline' })
      vim.keymap.set(
        "n",
        "<space>fB",
        ":Telescope file_browser<CR>",
        { noremap = true }
      )
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("cmdline")
      -- require("telescope").load_extension "session-lens"
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",

  }
}
