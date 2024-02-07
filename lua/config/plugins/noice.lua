return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    },
  config = function()
    require('noice').setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = false,
        },
        lsp_doc_border = true,
      }
    })
    vim.keymap.set('n', '<leader>nh', function() require('noice').cmd("history") end, { desc = "Noice history" })
    vim.keymap.set('n', '<leader>nl', function() require('noice').cmd("last") end, { desc = "Last Noice message" })
  end
}
