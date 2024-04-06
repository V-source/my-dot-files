return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      background_colour = '#00ff00',
     -- max_width = 60,
      timeout = 4000,
      -- render = "compact",
      top_down = true,
      opacity = { body = 30 },
    })
  end,
}
