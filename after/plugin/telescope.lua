local tsactions = require "telescope.actions"
local fbactions = require "telescope".extensions.file_browser.actions


require("telescope").setup {
  defaults = {
     initial_mode = "normal",
      mappings = {
          ["n"] = {
                ["e"] = tsactions.move_selection_next,
                ["i"] = tsactions.move_selection_previous,
          },
      },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      cwd_to_path = true,
      theme = "dropdown",
      mappings = {
        ["n"] = {
			["n"] = fbactions.goto_parent_dir,
			["e"] = tsactions.move_selection_next,
			["i"] = tsactions.move_selection_previous,
			["o"] = tsactions.select_default,

			["s"] = tsactions.toggle_selection + tsactions.move_selection_better,
			["."] = fbactions.toggle_hidden,
			["m"] = fbactions.create_from_prompt,
			["v"] = fbactions.move,
        },
      },
    },
  },
}
require("telescope").load_extension "file_browser"
