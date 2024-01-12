local function getWakaTime()
  if (os.date("%M") % 20 ~= 0 or os.date("%S") % 31 ~= 0) and vim.g.timeToday ~= nil then
    return vim.g.timeToday
  end

  _G.WakaTimeLocation = ""
  vim.cmd('redir => WakaTimeLocation')
  vim.cmd('silent WakaTimeCliLocation')
  vim.cmd('redir END')
  local WakaTimeLocation = vim.g.WakaTimeLocation

  local handle = io.popen(WakaTimeLocation .. " " .. "--today" )
  local timeToday = handle:read("*a")
  handle:close()

  if timeToday:match("%S") == nil then
    vim.g.timeToday = "0 mins"
    return "0 mins"
  end

  timeToday = string.match(timeToday, "([^\n]+)")
  vim.g.timeToday = timeToday

  return (timeToday)
end

local function fileIcon ()
    local icons = {
        ["lua"] = "",
        ["python"] = "󱔎",
        ["rust"] = "󰟟",
        ["c"] = "",
        ["cpp"] = "",
        ["sh"] = "",

        ["gitcommit"] = "",
        ["gitignore"] = "",
        ["fugitive"] = "",

        ["zsh"] = "",
        ["toml"] = "",
        ["conf"] = "",
        ["make"] = "",

        ["markdown"] = "",
        ["text"] = "",
        ["tex"] = "",

        ["gentoo-make-conf"] = "󰣨",
        ["gentoo-package-mask"] = "󰣨",
        ["gentoo-package-use"] = "󰣨",
        ["gentoo-package-keywords"] = "󰣨",

        ["alpha"] = "",
    }
    local icon = icons[vim.bo.filetype]
    return icon and icon or ""
end

local bubbles_theme = {
  normal = {
    a = { fg = _G.MyGlobalColors.black, bg = _G.MyGlobalColors.purple },
    b = { fg = _G.MyGlobalColors.grey, bg = _G.MyGlobalColors.bg1 },
    c = { fg = _G.MyGlobalColors.black, bg = _G.MyGlobalColors.bg0 },
  },

  insert = { a = { fg = _G.MyGlobalColors.black, bg = _G.MyGlobalColors.bg_blue } },
  visual = { a = { fg = _G.MyGlobalColors.black, bg =  _G.MyGlobalColors.cyan } },
  replace = { a = { fg = _G.MyGlobalColors.black, bg = _G.MyGlobalColors.red } },

  inactive = {
    a = { fg = _G.MyGlobalColors.dark_purple, bg = _G.MyGlobalColors.black },
    b = { fg = _G.MyGlobalColors.dark_red, bg = _G.MyGlobalColors.black },
    c = { fg = _G.MyGlobalColors.dark_yellow, bg = _G.MyGlobalColors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { fileIcon, 'progress' },
    lualine_z = {
      { getWakaTime, separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
