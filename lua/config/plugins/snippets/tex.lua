-- https://github.com/frankroeder/dotfiles/blob/657a5dc559e9ff526facc2e74f9cc07a1875cac6/nvim/lua/tsutils.lua#L59

local has_treesitter, ts = pcall(require, "vim.treesitter")
local _, query = pcall(require, "vim.treesitter")

local MATH_ENVIRONMENTS = {
  displaymath = true,
  equation = true,
  eqnarray = true,
  align = true,
  math = true,
  array = true,
}
local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
}

local function get_node_at_cursor()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_range = { cursor[1] - 1, cursor[2] }
  local buf = vim.api.nvim_get_current_buf()
  local ok, parser = pcall(ts.get_parser, buf, "latex")
  if not ok or not parser then
    return
  end
  local root_tree = parser:parse()[1]
  local root = root_tree and root_tree:root()

  if not root then
    return
  end

  return root:named_descendant_for_range(cursor_range[1], cursor_range[2], cursor_range[1], cursor_range[2])
end

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1184#issuecomment-830388856
local function in_mathzone()
  if has_treesitter then
    local buf = vim.api.nvim_get_current_buf()
    local node = get_node_at_cursor()
    while node do
      if MATH_NODES[node:type()] then
        return true
      elseif node:type() == "math_environment" or node:type() == "generic_environment" then
        local begin = node:child(0)
        local names = begin and begin:field("name")
        if names and names[1] and MATH_ENVIRONMENTS[query.get_node_text(names[1], buf):match("[A-Za-z]+")] then
          return true
        end
      end
      node = node:parent()
    end
    return false
  end
end

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({
    trig = "pi",
    dscr = "π",
    regTrig = true,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    t("\\pi"),
  }, {
    condition = in_mathzone,
  }),

  s({
    trig = "nab",
    dscr = "∇",
    regTrig = true,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    t("\\nabla"),
  }, {
    condition = in_mathzone,
  }),

  s({
    trig = "to",
    dscr = "→",
    regTrig = true,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    t("\\to"),
  }, {
    condition = in_mathzone,
  }),

  s({
    trig = "in",
    dscr = "∈",
    regTrig = true,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    t("\\in"),
  }, {
    condition = in_mathzone,
  }),

  s(
    { trig = "bf", dscr = "Bold font", snippetType = "autosnippet" },
    fmta(
      [[
        \mathbf{<>}
      ]],
      {
        i(1, "x"),
      }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "Rn", dscr = "Real coordinate space", snippetType = "autosnippet" },
    fmta(
      [[
        \mathbb{R}^<>
      ]],
      {
        i(1, "n"),
      }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "frac", dscr = "Fraction", snippetType = "autosnippet" },
    fmta(
      [[
        \frac{<>}{<>}
      ]],
      {
        i(1, "n"),
        i(2, "d"),
      }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "env", dscr = "Create a generic environment", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    ),
    { condition = in_mathzone }
  ),

  s(
    { trig = "colvec", dscr = "2D column vector", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{bmatrix}
            <> \\
            <> \\
        \end{bmatrix}
      ]],
      {
        i(1, "x"),
        i(2, "y"),
      }
    ),
    { condition = in_mathzone }
  ),

  s({
    trig = "(%s)%$",
    dscr = "autopair for $ within a block of text",
    regTrig = true,
    wordTrig = false,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    f(function(_, snip)
      return snip.captures[1]
    end),
    t("$"),
    i(0),
    t("$"),
  }),
}
