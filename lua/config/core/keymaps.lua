vim.g.mapleader = " "

-- colemak dh movement rebinds
vim.keymap.set({ "n", "x" }, "n", "h", { noremap = true })
vim.keymap.set({ "n", "x" }, "e", "j", { noremap = true })
vim.keymap.set({ "n", "x" }, "i", "k", { noremap = true })
vim.keymap.set({ "n", "x" }, "o", "l", { noremap = true })

vim.keymap.set({ "n", "v" }, "h", "i", { noremap = true })
vim.keymap.set({ "n", "v" }, "j", "o", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "n", { noremap = true })
vim.keymap.set({ "n", "v" }, "l", "e", { noremap = true })

-- :wq as root
vim.cmd([[command! -nargs=0 WW :execute 'w !doas tee % >/dev/null' | q!]])

-- delete highlighted without yanking
vim.api.nvim_set_keymap("x", "x", '"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>we", ":wincmd w<CR>", { desc = "Cycle next window" })
vim.keymap.set("n", "<Leader>wi", ":wincmd W<CR>", { desc = "Cycle prev window" })
