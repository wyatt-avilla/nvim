local exported = {}

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight" })
  end,
  group = highlight_group,
  pattern = "*",
})

function exported.update_mason_outdated()
  local registry = require("mason-registry")
  local installed_packages = registry.get_installed_package_names()
  local packages_outdated = 0
  local function pkg_inc(success, _)
    if success then
      packages_outdated = packages_outdated + 1
    end
  end

  for _, pkg in pairs(installed_packages) do
    local p = registry.get_package(pkg)
    if p then
      p:check_new_version(pkg_inc)
    end
  end

  vim.g.MasonOutdatedCount = packages_outdated
end

local mason_update_timer = vim.loop.new_timer()
mason_update_timer:start(1000, 1800000, vim.schedule_wrap(exported.update_mason_outdated))

local mason_update_checks = vim.api.nvim_create_augroup("mason_update_checks", { clear = true })
vim.api.nvim_create_autocmd("User", {
  callback = exported.update_mason_outdated,
  group = mason_update_checks,
  pattern = "LazyVimStarted",
})

function exported.update_time_today()
  local waka_time_bin = vim.api.nvim_exec("WakaTimeCliLocation", true)
  require("plenary.job")
    :new({
      command = waka_time_bin,
      args = { "--today" },
      on_exit = function(output, _)
        local time_today = output:result()[1]
        if time_today == nil then
          vim.g.timeToday = "0 mins"
        else
          vim.g.timeToday = time_today
        end
      end,
    })
    :start()
end

local wakatime_update_timer = vim.loop.new_timer()
wakatime_update_timer:start(1000, 1200000, vim.schedule_wrap(exported.update_time_today))

local wakatime_update = vim.api.nvim_create_augroup("wakatime_update", { clear = true })
vim.api.nvim_create_autocmd("User", {
  callback = exported.update_time_today,
  group = wakatime_update,
  pattern = "LazyVimStarted",
})

local close_timers = vim.api.nvim_create_augroup("close_timers", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    mason_update_timer:close()
    wakatime_update_timer:close()
  end,
  group = close_timers,
  pattern = "*",
})

return exported
