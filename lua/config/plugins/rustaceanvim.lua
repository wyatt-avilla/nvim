return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  init = function()
    vim.g.rustaceanvim = {
      hover_actions = {
        auto_focus = true,
      },
    }
  end,
}
