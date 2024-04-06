return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"markdown", "markdown_inline","astro", "css", "tsx", "typescript", "javascript", "html", "tmux", "lua", "vim"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
vim.filetype.add({
    extension = {
        astro = "astro"
    }
})
}
