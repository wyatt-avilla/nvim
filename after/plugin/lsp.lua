local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  experimental = {
      ghost_text = true
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
      { name = 'nvim_lsp'},
      { name = 'luasnip'},
      { name = 'path'},
      { name = 'buffer'},
      { name = 'cmp-nvim-lua'},
      { name = 'nvim_lsp_signature_help'},
      { name = 'nvim_lua'},
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
             nvim_lsp = '',
             luasnip = '󰆐',
             buffer = '󰏫',
             path = '󰆓',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
  mapping = {
    -- confirm completion
    ['<right>'] = cmp.mapping.confirm( {select = true} ),

    -- trigger completion menu
    ['<C-s>'] = cmp.mapping.complete(),

    -- "super tab"
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- they way you will only jump inside the snippet region
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
  }
})


require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
})


local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>ca", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
    hover_actions = {
      auto_focus = true,
    }
  },
})
