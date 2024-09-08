return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = "catppuccin",
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        -- section_separators = { left = '', right = '' },
        globalstatus = true,
      },

      -- sections = {
      --   lualine_a = {'mode'},
      --   lualine_c = {},
      --   lualine_x = {'filename'},
      --   lualine_z = {}
      -- },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        -- lualine_x = {'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { 'filename', color = { fg = '#ffffff', bg = '#2e2e2e' } } -- Cambia los colores aquí
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}
