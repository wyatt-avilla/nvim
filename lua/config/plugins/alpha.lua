return {
  "goolord/alpha-nvim",
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {

        [[                                                                           ]],
        [[                                                    88                     ]],
        [[                                                    ""                     ]],
        [[                                                                           ]],
        [[ 8b,dPPYba,    ,adPPYba,   ,adPPYba,   8b       d8  88  88,dPYba,,adPYba,  ]],
        [[ 88P'   `"8a  a8P_____88  a8"     "8a  `8b     d8'  88  88P'   "88"    "8a ]],
        [[ 88       88  8PP"""""""  8b       d8   `8b   d8'   88  88      88      88 ]],
        [[ 88       88  "8b,   ,aa  "8a,   ,a8"    `8b,d8'    88  88      88      88 ]],
        [[ 88       88   `"Ybbd8"'   `"YbbdP"'       "8"      88  88      88      88 ]],
        [[                                                                           ]],
        [[                                                                           ]],
        [[                             __ .-~-.   .~``~,._                           ]],
        [[                           .~  `     \ /     .  `\                         ]],
        [[                           |     \    |   .'     |                         ]],
        [[                     _      \     `.  |  /    __/                          ]],
        [[                  .~` `'. .--;.       ,.O  -~`   `\                        ]],
        [[                  \  '-. |     `-  o.O/o, __       |                       ]],
        [[                   '-.,__ \    .-~' `\|o `  ~.    /_                       ]],
        [[                     _.--'/   `    ,  /  \        | `~-.,                  ]],
        [[                    /     |       /  :    '._    / -.    `\                ]],
        [[                   /   .-' '.___.;   `      \`--'\    `    |               ]],
        [[                  |          /    \         /     '.__,.--,/               ]],
        [[                  '--..,___.'      `~--'--~'                               ]],

    }

    dashboard.section.buttons.val = {
        dashboard.button("f", "  find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  live grep", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  config", ":e ~/.config/nvim/<CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("m", "󰣪  Mason", ":Mason<CR>"),
        dashboard.button("q", "  quit", ":qa<CR>"),
    }

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
            local version = vim.version()
            local nvim_version_info = "     v" .. version.major .. "." .. version.minor .. "." .. version.patch
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = ' ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms' .. '        ' .. nvim_version_info
            pcall(vim.cmd.AlphaRedraw)
        end,
    })
  end
}
