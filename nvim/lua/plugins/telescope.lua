return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', 'jonarrien/telescope-cmdline.nvim', },
    config = function()
      require('telescope').setup({
        defaults = {
          path_display = { 'truncate' },
          file_ignore_patterns = { "node_modules/*" },
          preview = {
            treesitter = false,
          },
          layout_config = {
            preview_width = .5,
            horizontal = {
              size = {
                width = "90%",
                height = "90%",
              },
            },
          },
        },
        -- pickers = {
        --   find_files = {
        --     theme = "dropdown",
        --   }
        -- },
      })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

      -- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      -- ::> find comments

      vim.keymap.set('n', '<leader>fc', function()
        require 'telescope.builtin'.grep_string {
          shorten_path = true,
          word_match = "-w",
          only_sort_text = true,
          search = '::>'
        }
      end, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})


      vim.keymap.set('n', '<leader>fht', builtin.help_tags, {})
      -- ╭─────────────────────────────────────────────────────────╮
      -- │ LISTS FUNCTION NAMES, VARIABLES, FROM TREESITTER!       │
      -- ╰─────────────────────────────────────────────────────────╯
      -- ┌                                                         ┐
      -- para ver un listado de todos los nombres de variables
      -- y funciones desde treestter.
      -- util para buscar una funcion, constante, variables, parametros
      -- vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})


      -- ╭─────────────────────────────────────────────────────────╮
      -- │ LISTS LSP DOCUMENT SYMBOLS IN THE CURRENT BUFFER        │
      -- ╰─────────────────────────────────────────────────────────╯
      -- super util.
      -- permite buscar todos lo simbolos de lsp en el documento actual
      -- por simbolo se entiede:
      -- funciones, variables, constantes, propiedades
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})


      -- ──────────────────────────────────────────────────────────────────────
      -- ╭─────────────────────────────────────────────────────────╮
      -- │ LISTS LSP REFERENCES FOR WORD UNDER THE CURSOR          │
      -- ╰─────────────────────────────────────────────────────────╯
      -- ┌                                                         ┐
      -- │ super util - otra busca donde se hace referencia a la   │
      -- │ palabra bajo el cursor en todos los documentos              │
      -- │ similar al comando gd (ir a definicion) solo que mejor  │
      -- └                                                         ┘
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
      -- ──────────────────────────────────────────────────────────────────────

      -- ╭─────────────────────────────────────────────────────────╮
      -- │ SEARCHES FOR THE STRING UNDER YOUR CURSOR OR SELECTION  │
      -- │ IN YOUR CURRENT WORKING DIRECTORY                       │
      -- ╰─────────────────────────────────────────────────────────╯
      -- ┌                                                         ┐
      -- │ busca la palabra debajo del cursor en el directorio     │
      -- │ actual                                                  │
      -- └                                                         ┘
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
      -- ──────────────────────────────────────────────────────────────────────


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
