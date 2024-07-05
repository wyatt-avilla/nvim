return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  event = { "InsertEnter" },
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/config/plugins/snippets/" })
    require("luasnip").config.set_config({ enable_autosnippets = true })
    require("luasnip").filetype_extend("markdown", { "tex" })
  end,
}
