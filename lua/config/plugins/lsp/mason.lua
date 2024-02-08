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
    local lspconfig = require("mason-lspconfig")
    local tool_installer = require("mason-tool-installer")

    mason.setup()

    lspconfig.setup({
      ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "pylsp",         -- formatting
          --"pyright",
          "marksman",
          "rust_analyzer",
      },
      handlers = {
        lsp.default_setup,
      }
    })

    tool_installer.setup({
      ensure_installed = {
          "stylua",
          "black",
          "isort",
          "clang-format",
          "shfmt",
          "rustfmt",
      }
    })
  end
}
