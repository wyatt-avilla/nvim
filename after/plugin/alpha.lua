-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

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
[[                                        __/)                               ]],
[[                                     .-(__(=:                              ]],
[[                                     |    \)                               ]],
[[                               (\__  |                                     ]],
[[                              :=)__)-|  __/)                               ]],
[[                               (/    |-(__(=:                              ]],
[[                             ______  |  _ \)                               ]],
[[                            /      \ | / \                                 ]],
[[                                 ___\|/___\                                ]],
[[                                [         ]\                               ]],
[[                                 \       /  \                              ]],
[[                                  \     /                                  ]],
[[                                   \___/                                   ]],


}

 dashboard.section.buttons.val = {
   dashboard.button("f", "  find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r", "  recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  configuration", ":e ~/.config/nvim/<CR>"),
   dashboard.button("q", "  quit", ":qa<CR>"),
}

local function footer()
    local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
    local version = vim.version()
    local nvim_version_info = "     v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return " " .. total_plugins .. " plugins" .. "             " .. nvim_version_info
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

