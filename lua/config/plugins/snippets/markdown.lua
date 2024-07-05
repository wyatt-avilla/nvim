return {
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

  s({
    trig = "^%$",
    dscr = "big math zone",
    regTrig = true,
    wordTrig = false,
    priority = 100,
    snippetType = "autosnippet",
  }, {
    t({ "$$", "    " }),
    i(0),
    t({ "", "$$" }),
  }),
}
