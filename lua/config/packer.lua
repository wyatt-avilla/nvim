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
        {'L3MON4D3/LuaSnip'},     -- required

        {"hrsh7th/cmp-path"},     -- path
        {"hrsh7th/cmp-buffer"},   -- path

        -- misc. lsp stuff
        {'simrat39/rust-tools.nvim'},
    }
}


    -- alpha
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }


    -- startup time
    use ( "dstein64/vim-startuptime" )


end)
