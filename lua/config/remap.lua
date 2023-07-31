vim.g.mapleader = " "

-- colemak dh movement rebinds
vim.api.nvim_set_keymap('n', 'n', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'n', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'e', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'i', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'o', '<Right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'h', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'h', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'e', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'e', { noremap = true, silent = true })


-- find previous occurrence fix
vim.api.nvim_set_keymap('n', '<S-k>', '<S-n>', { noremap = true, silent = true })


-- :wq as root
vim.cmd([[
  command! -nargs=0 WW :execute 'w !doas tee % >/dev/null' | q!
]])


-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lg', ':Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lf', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
