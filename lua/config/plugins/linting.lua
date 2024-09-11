return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      sh = { "shellcheck" },
      markdown = { "markdownlint" },
      python = { "mypy" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>al", function()
      lint.try_lint()
    end, { desc = "Lint" })

    local mypy_args = lint.linters.mypy.args
    mypy_args[#mypy_args + 1] = "--strict"
  end,
}
