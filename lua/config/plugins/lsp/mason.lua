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
    local registry = require("mason-registry")

    registry:on("package:install:success", function(_)
      require("config.core.autocmds").update_mason_outdated()
    end)

    mason.setup({
      ui = {
        border = "rounded",
      },
    })

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
        ["rust_analyzer"] = function() end, -- rustaceanvim handles this
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
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
