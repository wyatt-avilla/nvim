return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  init = function()
    local ts = require("nvim-treesitter.configs")

    ts.setup({
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,

      ensure_installed = {
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "toml",
        "regex",
      },
    })
  end,
  opts = {},
}
