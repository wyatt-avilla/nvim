local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})


require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ["i"] = {
			["e"] = require('telescope.actions').move_selection_next,
			["i"] = require('telescope.actions').move_selection_previous,
			["o"] = require('telescope.actions').select_default,
        },
        ["n"] = {
			["e"] = require('telescope.actions').move_selection_next,
			["i"] = require('telescope.actions').move_selection_previous,
			["o"] = require('telescope.actions').select_default,
        },
      },
    },
  },
}
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)