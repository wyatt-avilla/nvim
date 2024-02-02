vim.g.mapleader = " "

-- colemak dh movement rebinds
vim.api.nvim_set_keymap('n', 'n', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'n', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'e', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'i', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'o', '<Right>', { noremap = true, silent = true })

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


--  delete without yanking
vim.api.nvim_set_keymap('x', 'x', '\"_d', { noremap = true, silent = true })


-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lg', ':Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>S', ':Telescope grep_string<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lb', ':Telescope buffers<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lf', ':Telescope file_browser path=%:p:h select_buffer=true no_ignore=true<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>sh', [["zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>]],
    { noremap = true, silent = true })

-- fix kitty enter key
vim.api.nvim_set_keymap("", "<kEnter>", "<Enter>", {})
vim.api.nvim_set_keymap("i", "<kEnter>", "<Enter>", {})
vim.api.nvim_set_keymap("c", "<kEnter>", "<Enter>", {})

-- code actions preview
vim.api.nvim_set_keymap("n", "<leader>ca", ":lua require('actions-preview').code_actions()<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>ca", ":lua require('actions-preview').code_actions()<CR>", {})

-- expand inline error
vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>", {})
