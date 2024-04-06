return {
  {
    'numToStr/Comment.nvim',

    config = function()
      require('Comment').setup({
        filetypes = { 'javascriptreact', 'javascript', 'jsx', 'html', 'css', 'typescriptreact' }
      })
    end,
    lazy = false,
  },
  {
    "LudoPinelli/comment-box.nvim",
    config = function()
      require('comment-box').setup()
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      -- Titles
      -- dsfsdf
      keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBllbox 18 <CR>", opts)
      -- keymap({ "n", "v" }, '<Leader>cb', ':<C-U>execute "CBccbox " . v:count<CR>',opts)
      keymap({ "n", "v" }, '<Leader>cbc', ':<C-U>execute "CBlcbox " . v:count<CR>', opts)
      keymap({ "n", "v" }, '<Leader>cbl', ':<C-U>execute "CBllbox " . v:count<CR>', opts)
      keymap({ 'n', 'v' }, '<Leader>cblc', ':<C-U>execute "CBllbox " . v:count<CR>', opts)
      keymap({ 'n', 'v' }, '<Leader>cbr', ':<C-U>execute "CBrrbox " . v:count<CR>', opts)
      -- Named parts
      -- keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
      keymap({ "n", "v" }, "<Leader>ct", ':<C-U>execute "CBclline " . v:count<CR>', opts)
      keymap({ "n", "v" }, "<Leader>ctr", ':<C-U>execute "CBrrline " . v:count<CR>', opts)
      keymap({ "n", "v" }, "<Leader>ctc", ':<C-U>execute "CBccline " . v:count<CR>', opts)
      -- Simple line
      keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
      keymap("i", "<M-m>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
      -- Marked comments
      keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)
      -- Removing a box is simple enough with the command (CBd), but if you
      -- use it a lot:
      keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)
    end
  },
  --  ╭─ ( START ) ──────────────────────────────────────────────────────╮
  --
  --  ╰─ ( END ) ────────────────────────────────────────────────────────╯
}
-- ╭─────────────────────────────────────────────────────────╮
-- │                        COMMANDOS                        │
-- ╰─────────────────────────────────────────────────────────╯
-- ┌─────────────────────────────────────────────────────────┐
--   NORMAL MODE
-- └─────────────────────────────────────────────────────────┘
-- ┌                                                         ┐
-- │ `gcc` - Toggles the current line using linewise comment │
-- │ `gbc` - Toggles the current line using blockwise comment│
-- │ `[count]gcc` - Toggles the number of line given as a    │
-- │ prefix-count using linewise                             │
-- │ `[count]gbc` - Toggles the number of line given as a    │
-- │ prefix-count using blockwise                            │
-- │ `gc[count]{motion}` - (Op-pending) Toggles the region   │
-- │ using linewise comment                                  │
-- │ `gb[count]{motion}` - (Op-pending) Toggles the region   │
-- │ using blockwise comment                                 │
-- └                                                         ┘
-- ┌─────────────────────────────────────────────────────────┐
--   EXTRA MAPPINGS                                          
-- └─────────────────────────────────────────────────────────┘
-- ┌                                                         ┐
-- │ gco` - Insert comment to the next line and enters       │
-- │ INSERT mode                                             │
-- │ gcO` - Insert comment to the previous line and enters   │
-- │ INSERT mode                                             │
-- │ gcA` - Insert comment to end of the current line and    │
-- │ enters INSERT mode                                      │
-- └                                                         ┘
-- ┌─────────────────────────────────────────────────────────┐
--   VISUAL MODE
-- └─────────────────────────────────────────────────────────┘
-- ┌                                                         ┐
-- │ gc` - Toggles the region using linewise comment         │
-- │ gb` - Toggles the region using blockwise comment        │
-- └                                                         ┘
--  
--
