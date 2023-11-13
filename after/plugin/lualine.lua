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

  timeToday = string.match(timeToday, "([^\n]+)")
  vim.g.timeToday = timeToday

  return (timeToday)
end

local colors = {
  blue   = '#165776',
  cyan   = '#389aac',
  black  = '#1d1d1d',
  white  = '#c6c6c6',
  red    = '#d18ea6',
  violet = '#a57fc4',
  grey   = '#3f3f3f',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
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
    lualine_y = { 'filetype', 'progress' },
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
