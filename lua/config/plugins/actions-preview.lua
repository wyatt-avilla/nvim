return {
  "aznhe21/actions-preview.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local actions = require('actions-preview')
    vim.keymap.set('n', '<leader>ca', actions.code_actions, { desc = "Code actions" })
  end
}
