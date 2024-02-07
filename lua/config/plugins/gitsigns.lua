return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gs = require('gitsigns')
    gs.setup()
    vim.keymap.set('n', '<leader>ghp', gs.preview_hunk, { desc = "Preview hunk" })
    vim.keymap.set('n', '<leader>ghs', gs.stage_hunk, { desc = "Stage hunk" })
    vim.keymap.set('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "Undo staged hunk" })
    vim.keymap.set('n', '<leader>ghr', gs.reset_hunk, { desc = "Reset hunk" })
    vim.keymap.set('n', '<leader>ghd', gs.diffthis, { desc = "Diff hunk" })
  end
}
