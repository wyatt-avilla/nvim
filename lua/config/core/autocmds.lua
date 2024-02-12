local function update_time_today()
  _G.WakaTimeLocation = ""
  vim.cmd("redir => WakaTimeLocation")
  vim.cmd("silent WakaTimeCliLocation")
  vim.cmd("redir END")
  local WakaTimeLocation = vim.g.WakaTimeLocation

  local handle = io.popen(WakaTimeLocation .. " " .. "--today")
  local timeToday
  if handle then
    timeToday = handle:read("*a")
    handle:close()
  else
    timeToday = "WakaTime Missing"
  end

  if timeToday:match("%S") == nil then
    vim.g.timeToday = "0 mins"
  else
    timeToday = string.match(timeToday, "([^\n]+)")
    vim.g.timeToday = timeToday
  end
end

local wakatime_update_timer = vim.loop.new_timer()
wakatime_update_timer:start(1000, 1200000, vim.schedule_wrap(update_time_today))

local wakatime_update = vim.api.nvim_create_augroup("wakatime_update", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  callback = update_time_today,
  group = wakatime_update,
  pattern = "*",
})
