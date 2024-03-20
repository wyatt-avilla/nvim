return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function fileIcon()
      local icons = {
        ["lua"] = "",
        ["python"] = "󱔎",
        ["rust"] = "󰟟",
        ["c"] = "",
        ["cpp"] = "",
        ["asm"] = "",
        ["sh"] = "",

        ["gitcommit"] = "",
        ["diff"] = "",
        ["gitignore"] = "",
        ["fugitive"] = "",

        ["zsh"] = "",
        ["toml"] = "",
        ["conf"] = "",
        ["make"] = "",
        ["dockerfile"] = "󰡨",

        ["markdown"] = "",
        ["text"] = "",
        ["tex"] = "",

        ["gentoo-make-conf"] = "󰣨",
        ["gentoo-package-mask"] = "󰣨",
        ["gentoo-package-use"] = "󰣨",
        ["gentoo-package-keywords"] = "󰣨",

        ["alpha"] = "",
      }
      local icon = icons[vim.bo.filetype]
      return icon and icon or ""
    end

    local theme = require("kanagawa.colors").setup().theme
    local lualine_theme = {
      normal = {
        a = { bg = theme.syn.keyword, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.keyword },
        c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
      },
      insert = {
        a = { bg = theme.diag.ok, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.diag.ok },
      },
      command = {
        a = { bg = theme.syn.operator, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.operator },
      },
      visual = {
        a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
        b = { bg = theme.diff.change, fg = theme.syn.fun },
      },
      replace = {
        a = { bg = theme.syn.constant, fg = theme.ui.bg },
        b = { bg = theme.ui.bg, fg = theme.syn.constant },
      },
      inactive = {
        a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
        c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      },
    }
    require("lualine").setup({
      options = {
        theme = lualine_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "fileformat" },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
          {
            function()
              return " " .. vim.g.MasonOutdatedCount
            end,
            cond = function()
              return vim.g.MasonOutdatedCount and vim.g.MasonOutdatedCount > 0
            end,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = { fileIcon, "progress" },
        lualine_z = {
          {
            function()
              return vim.g.timeToday and vim.g.timeToday or "0 mins"
            end,
            separator = { right = "" },
            left_padding = 2,
          },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
