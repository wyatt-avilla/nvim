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
              runtime = { version = "LuaJIT" },
              Lua = {
                workspace = {
                  checkThirdParty = false,
                  library = {
                    "${3rd}/luv/library",
                    unpack(vim.api.nvim_get_runtime_file("", true)),
                  },
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

    local function update_mason_outdated()
      local installed_packages = registry.get_installed_package_names()
      local packages_outdated = 0
      local function pkg_inc(success, _)
        if success then
          packages_outdated = packages_outdated + 1
        end
      end

      for _, pkg in pairs(installed_packages) do
        local p = registry.get_package(pkg)
        if p then
          p:check_new_version(pkg_inc)
        end
      end

      vim.g.MasonOutdatedCount = packages_outdated
    end

    local mason_update_group = vim.api.nvim_create_augroup("mason_update", { clear = true })

    local mason_update_timer = vim.loop.new_timer()
    mason_update_timer:start(1000, 1800000, vim.schedule_wrap(update_mason_outdated))
    vim.api.nvim_create_autocmd("VimLeave", {
      callback = function()
        mason_update_timer:close()
      end,
      group = mason_update_group,
      pattern = "*",
    })

    vim.api.nvim_create_autocmd("User", {
      callback = update_mason_outdated,
      group = mason_update_group,
      pattern = "LazyVimStarted",
    })
  end,
}
