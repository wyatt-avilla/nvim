local ls = require 'luasnip'
local tsutils = require "config.tsutils"
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
    enable_autosnippets = true,
})

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("markdown", {
    s({ trig = "ff", name = "fraction", desc = "fraction expansion with placeholders", snippetType = "autosnippet" }, {
            t("\\frac{"),
            i(1, "a"),
            t("}{"),
            i(2, "b"),
            t("}"),
            i(0),
        },
        { condition = tsutils.in_mathzone }
    ),

    s({ trig = "*", name = "cdot", snippetType = "autosnippet" }, {
            t("\\cdot"),
            i(1)
        },
        { condition = tsutils.in_mathzone }
    ),

    s({ trig = "...", name = "cdots", snippetType = "autosnippet" }, {
            t("\\cdots"),
            i(1)
        },
        { condition = tsutils.in_mathzone }
    ),

    s({ trig = "R([%dn])", name = "n-space", desc = "boldface n-space notation", regTrig = true, snippetType =
        "autosnippet" }, {
            t("\\mathbb{R}^{"),
            f(function(_, snip) return snip.captures[1] end),
            t("}"),
            i(1)
        },
        { condition = tsutils.in_mathzone }
    ),

    s(
        { trig = "([uvw])([%dn])", name = "vector", desc = "vector expansion with subscript", regTrig = true, snippetType =
        "autosnippet" }, {
            t("\\vec{"),
            f(function(_, snip) return snip.captures[1] end),
            t("}_{"),
            f(function(_, snip) return snip.captures[2] end),
            t("}"),
            i(1)
        },
        { condition = tsutils.in_mathzone }
    ),

    s(
    { trig = "([^%a])mm", name = "inline math", desc = "inline math expansion", wordTrig = false, regTrig = true, snippetType =
    "autosnippet" }, {
        f(function(_, snip) return snip.captures[1] end),
        t("$"),
        i(1, "x"),
        t("$"),
        i(0),
    }),

    s({ trig = "bmatrix", name = "bracket matrix", desc = "2x2 b-matrix", }, {
        t({ "\\begin{bmatrix}", "" }),
        i(1, "a"), t(" & "), i(2, "b"), t({ " \\\\", "" }),
        i(3, "c"), t(" & "), i(4, "d"), t({ " \\\\", "" }),
        t({ "\\end{bmatrix}", "" }),
        i(0),
    }),

    s({ trig = "pmatrix", name = "parenthesis matrix", desc = "2x2 p-matrix", }, {
        t({ "\\begin{pmatrix}", "" }),
        i(1, "a"), t(" & "), i(2, "b"), t({ " \\\\", "" }),
        i(3, "c"), t(" & "), i(4, "d"), t({ " \\\\", "" }),
        t({ "\\end{pmatrix}", "" }),
        i(0),
    }),

})
