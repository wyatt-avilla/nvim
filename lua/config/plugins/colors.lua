return {
    "rebelot/kanagawa.nvim",
    priority=1000,
    config = function()
      require('kanagawa').setup({
    colors = {
        theme = {
            all = {
                ui = {
                  float = {
                  },
                  bg_gutter = "none"
                }
            }
        }
    },
      })
      vim.cmd("colorscheme kanagawa")
      vim.cmd("highlight! link FloatBorder TelescopeBorder")
      vim.cmd("highlight! link NormalFloat TelescopeNormal")
      vim.cmd('highlight YankHighlight guibg = ' .. require("kanagawa.colors").setup().palette.oniViolet .. ' guifg = ' .. require("kanagawa.colors").setup().palette.fujiWhite)
    end
}
