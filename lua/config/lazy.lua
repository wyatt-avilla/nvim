local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "config.plugins" }, { import = "config.plugins.lsp" } }, {
  install = {
    colorscheme = { "kanagawa" },
  },
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
    frequency = 3600,
  },
  ui = {
    border = "rounded",
    backdrop = 100,
  },
})
