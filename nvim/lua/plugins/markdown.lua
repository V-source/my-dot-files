return {
  "MeanderingProgrammer/render-markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    require("render-markdown").setup({

      heading = {
        enabled = true,
        icons = {
          "❱ ",
          "❱❱ ",
          "❱❱❱ ",
          "❱❱❱ ",
          "❱❱❱❱",
          "❱❱❱❱❱ ",
          "❱❱❱❱❱❱",
        },
        signs = { "󰫎 " },
        border = true,
        border_prefix = false,
        above = "─",
        below = "─",
        left_pad = 3,
        right_pad = 3,
        width = "block",
      },
      dash = {
        -- icon = "╾",
        icon = "⏛",
      },
      quote = {
        icon = '▋',
      },
      indent = {
        -- Turn on / off org-indent-mode
        enabled = false,
        -- Amount of additional padding added for each heading level
        per_level = 2,
        -- Heading levels <= this value will not be indented
        -- Use 0 to begin indenting from the very first level
        skip_level = 1,
        -- Do not indent heading titles, only the body
        skip_heading = false,
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
        -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
        abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
        summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo" },
        tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo" },
        info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
        todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
        hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess" },
        success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
        check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess" },
        done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
        question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
        help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn" },
        faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn" },
        attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
        failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
        fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError" },
        missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError" },
        danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
        error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError" },
        bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", signs = '󰨰 ' },
        example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
        quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
        cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote" },
      },
    })
    vim.keymap.set("n", "<leader>md", ":RenderMarkdown toggle<CR>", { silent = true })
  end,
}
