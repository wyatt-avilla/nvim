-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- telescope 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
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
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
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
