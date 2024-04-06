return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
     options = { theme = "catppuccin" },
      sections = {
        lualine_a = {'mode'},
        lualine_c = {},
        lualine_x = {'filename'},
        lualine_z = {}
      }
    })
  end
}
