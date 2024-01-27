_G.MyGlobalColors = {
    black = "#181a1f",
    bg0 = "#1d1d1d",
    bg1 = "#3f3f3f",
    bg2 = "#7f7f7f",
    bg_d = "#1d1d1d",
    bg_blue = "#165776",
    bg_yellow = "#ebd09c",
    fg = "#abb2bf",
    purple = "#a57fc4",
    green = "#7bb75b",
    orange = "#77592e",
    blue = "#4c99d3",
    yellow = "#e8b32a",
    cyan = "#389aac",
    red = "#d18ea6",
    grey = "#b1b5ae",
    light_grey = "#f9faf6",
    dark_cyan = "#76bbca",
    dark_red = "#ce3e60",
    dark_yellow = "#93691d",
    dark_purple = "#5f4190",
    diff_add = "#31392b",
    diff_delete = "#382b2c",
    diff_change = "#1c3448",
    diff_text = "#2c5372",
}
require('onedark').setup({ colors = MyGlobalColors })

local TelescopeColors = {
    TelescopeMatching = { fg = MyGlobalColors.yellow },
    TelescopeSelection = { bg = MyGlobalColors.bg2 },

    TelescopePromptTitle = { fg = MyGlobalColors.yellow, bg = MyGlobalColors.bg0 },
    TelescopePromptPrefix = { fg = MyGlobalColors.yellow },
    TelescopePromptBorder = { fg = MyGlobalColors.purple, bg = MyGlobalColors.bg0 },

    TelescopeResultsTitle = { fg = MyGlobalColors.yellow, bg = MyGlobalColors.bg0 },
    TelescopeResultsBorder = { fg = MyGlobalColors.purple, bg = MyGlobalColors.bg0 },

    TelescopePreviewTitle = { fg = MyGlobalColors.yellow, bg = MyGlobalColors.bg0 },
    TelescopePreviewBorder = { fg = MyGlobalColors.purple, bg = MyGlobalColors.bg0 },
}

function Color_init(color)
    color = color or "onedark"
    vim.cmd.colorscheme(color)

    for hl, col in pairs(TelescopeColors) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

Color_init()
