return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',   -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('render-markdown').setup()
    vim.keymap.set('n', '<leader>md', ':RenderMarkdownToggle <CR>', {silent= true})
  end,

}
