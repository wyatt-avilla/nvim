local builtin = require('telescope.builtin')


require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      cwd_to_path = true,
      mappings = {
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
