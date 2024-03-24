local M = {}

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight" })
  end,
  group = highlight_group,
  pattern = "*",
})

function M.update_mason_outdated()
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
mason_update_timer:start(1000, 1800000, vim.schedule_wrap(M.update_mason_outdated))

local mason_update_checks = vim.api.nvim_create_augroup("mason_update_checks", { clear = true })
vim.api.nvim_create_autocmd("User", {
  callback = M.update_mason_outdated,
  group = mason_update_checks,
  pattern = "LazyVimStarted",
})

local close_timers = vim.api.nvim_create_augroup("close_timers", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    mason_update_timer:close()
  end,
  group = close_timers,
  pattern = "*",
})

return M
