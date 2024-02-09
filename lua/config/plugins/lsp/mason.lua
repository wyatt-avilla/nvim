return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local lsp = require("lsp-zero")
    local mason_lspconfig = require("mason-lspconfig")
    local tool_installer = require("mason-tool-installer")

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "bashls",
        "clangd",
        "pylsp",
        "marksman",
        "rust_analyzer",
      },
      handlers = {
        lsp.default_setup,
        require("lspconfig").lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        }),
      },
    })

    tool_installer.setup({
      ensure_installed = {
        -- formatters
        "stylua",
        "black",
        "isort",
        "clang-format",
        "shfmt",
        "rustfmt",
        "markdownlint",
        "prettier",
        -- linters
        "shellcheck",
        "markdownlint",
        "mypy",
        "pylint",
      },
    })
  end,
}
