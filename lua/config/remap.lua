vim.g.mapleader = " "

-- colemak dh movement rebinds
vim.api.nvim_set_keymap('n', 'n', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<Right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'h', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'e', { noremap = true, silent = true })
