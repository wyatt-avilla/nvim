return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        markdown = { "markdownlint" },
        c = { "clang_format" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        async = false,
        timeout = 500,
      },
    })

    vim.keymap.set("n", "<leader>af", function()
      conform.format({
        async = 500,
      })
    end, { desc = "Format" })
  end,
}
