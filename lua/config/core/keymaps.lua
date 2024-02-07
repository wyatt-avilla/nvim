vim.g.mapleader = " "

-- colemak dh movement rebinds
vim.api.nvim_set_keymap('n', 'n', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'n', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'e', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', 'l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'o', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'h', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'h', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'e', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'e', { noremap = true, silent = true })

-- find previous occurrence remap
--vim.api.nvim_set_keymap('n', '<S-k>', '<S-n>', { noremap = true, silent = true })

-- :wq as root
vim.cmd([[command! -nargs=0 WW :execute 'w !doas tee % >/dev/null' | q!]])

-- kitty enter key
vim.api.nvim_set_keymap("", "<kEnter>", "<Enter>", {})
vim.api.nvim_set_keymap("i", "<kEnter>", "<Enter>", {})
vim.api.nvim_set_keymap("c", "<kEnter>", "<Enter>", {})

-- delete highlighted without yanking
vim.api.nvim_set_keymap('x', 'x', '\"_d', { noremap = true, silent = true })
