-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight" })
  end,
  group = highlight_group,
  pattern = "*",
})

local codio_group = vim.api.nvim_create_augroup("CodioGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    vim.bo.filetype = "cpp"
    vim.b.disable_autoformat = true
  end,
  group = codio_group,
  pattern = "codio.com_*.txt",
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function(e)
    if vim.g.timer_started == true then
      return
    end
    vim.g.timer_started = true
    vim.fn.timer_start(1500, function()
      vim.g.timer_started = false
      vim.cmd("silent! w")
    end)
  end,
  group = codio_group,
  pattern = "codio.com_*.txt",
})
