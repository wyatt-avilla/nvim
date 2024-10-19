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

    vim.diagnostic.config({
      float = {
        source = "always",
        show_header = true,
        border = "rounded",
      },
      jump = { float = true },
    })

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add error to quick-fix list" })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Jump to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Jump to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover info" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Jump to implementation" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Hover help" })
        vim.keymap.set(
          "n",
          "<leader>wa",
          vim.lsp.buf.add_workspace_folder,
          { buffer = ev.buf, desc = "Add workspace folder" }
        )
        vim.keymap.set(
          "n",
          "<leader>wr",
          vim.lsp.buf.remove_workspace_folder,
          { buffer = ev.buf, desc = "Remove workspace folder" }
        )
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "List workspace folders" })
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Lsp rename" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Lsp references" })
      end,
    })

    lsp.set_sign_icons({
      error = "",
      warn = "",
      hint = "󰥱",
      info = "",
    })
  end,
}
