return {}
--[[ return {


  "rest-nvim/rest.nvim"
  ,
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("rest-nvim").setup({
      client = "curl",
    })
    vim.keymap.set('n', '<leader>rest', ':Rest run<CR>')
  end
} ]]
