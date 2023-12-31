-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- telescope 
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }


    -- colorscheme
    use { "navarasu/onedark.nvim" }


    -- tree sitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})


    -- yuck highlighting
    use( "elkowar/yuck.vim" )


    -- wakatime
    use( "wakatime/vim-wakatime" )


    -- colorizer
    use( "norcalli/nvim-colorizer.lua" )


    -- fugitive (git)
    use ( "tpope/vim-fugitive" )


    -- git-signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            {'nvim-tree/nvim-web-devicons', opt = true},
    },
    }


    -- lsp zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- required
            {                                      -- optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- required
        {'hrsh7th/cmp-nvim-lsp'}, -- required
        {'L3MON4D3/LuaSnip', run = "make install_jsregexp"},     -- required

        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-nvim-lsp-signature-help"},
        {"hrsh7th/cmp-nvim-lua"},
    }
}

    -- copilot
    use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function ()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
      end
    }

    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }

    -- rust
    use {'simrat39/rust-tools.nvim'}

    -- code action preview
    use {"aznhe21/actions-preview.nvim"}

    -- snippets
    use ( "rafamadriz/friendly-snippets" )
    use ( "saadparwaiz1/cmp_luasnip" )


    -- alpha
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }


    -- startup time
    use ( "dstein64/vim-startuptime" )

    -- autoclose
    use ( 'm4xshen/autoclose.nvim' )

    -- surround
    use ( 'tpope/vim-surround' )

    -- gentoo/portage syntax
    use ( 'gentoo/gentoo-syntax' )

end)
