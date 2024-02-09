return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  },
  config = function()
    local lsp = require("lsp-zero")
    local lspconfig = require("lspconfig")

    vim.diagnostic.config({
      float = {
        source = "always",
        show_header = true,
        border = "rounded",
      },
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ client = bufnr })
    end)

    lsp.set_sign_icons({
      error = "",
      warn = "",
      hint = "󰥱",
      info = "",
    })

    vim.keymap.set(
      "n",
      "<leader>e",
      ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
      { desc = "Expand inline error" }
    )
  end,
}
