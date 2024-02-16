return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({
          col_offset = -2,
          side_padding = 0,
          winhighlight = "Normal:Whitespace,FloatBorder:TelescopeResultsBorder,CursorLine:TelescopeSelection,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Whitespace,FloatBorder:TelescopeResultsBorder,CursorLine:TelescopeSelection,Search:None",
        }),
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local source_icon = {
            copilot = "",
            nvim_lsp = "",
            luasnip = "󰆐",
            buffer = "",
            path = "󰆓",
          }
          local kind_icon = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "󱐋",
            Operator = "󰆕",
            TypeParameter = "󰅲",
          }
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          item.kind = " " .. kind_icon[strings[2]]
          item.menu = source_icon[entry.source.name]
          return item
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "cmp-nvim-lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
      },
      mapping = {
        -- confirm completion
        ["<right>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- trigger completion menu
        ["<C-s>"] = cmp.mapping.complete(),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        -- "super tab"
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })
  end,
}
