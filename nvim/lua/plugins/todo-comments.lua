-- coment: ''
-- que te puedo decir al respect con esto.

-- c: skdfskdfskdjkfjslkjdlfjslkdfskdfjksdf
-- todo: 
-- done:
-- note: 

return {
  "folke/todo-comments.nvim",
  enabled = true,
  dependencies = "nvim-lua/plenary.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("todo-comments").setup({
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "fix", "FIXME", "BUG", "FIXIT", "ISSUE" } },
        -- TODO = { icon = " ", color = "info", alt = { "TASK", "todo" } },
        TODO = { icon = "◻ ", color = "info", alt = { "TASK", "todo" } },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "optimize" } },
        NOTE = { icon = "👓", color = "hint", alt = { "INFO", 'note' } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        DONE = { icon = "✔ ", color = "#A7BFE3", alt = { "COMPLETED", "done" } },
        _c = { icon = "✒ ", color = "#AAAAAA", alt = { "_C", "comment", "::> " } },
      },

      gui_style = {
        fg = "NONE",                     -- The gui style to use for the fg highlight group.
        bg = "BOLD",                     -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true,             -- when true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true,                -- enable multine todo comments
        multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- uses treesitter to match keywords in comments only
        max_line_len = 400,              -- ignore lines longer than this
        exclude = {},                    -- list of file types to exclude highlighting
      },
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
        done = { "Done", "#FFFFFF" },

      },
    })
    -- : cambiar el atajo de teclado
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })


    -- You can also specify a list of valid jump keywords

    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
    end, { desc = "Next error/warning todo comment" })
  end
}
