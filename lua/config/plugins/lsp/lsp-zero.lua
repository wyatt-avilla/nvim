return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        { 'L3MON4D3/LuaSnip', version = "v2.*", build = "make install_jsregexp" },
    },
    config = function()
        local lsp = require('lsp-zero')
        local lspconfig = require('lspconfig')

        lsp.preset('recommended')
        lsp.setup()

        require('mason-lspconfig').setup_handlers({
            function(server)
              lspconfig[server].setup({})
            end
        })

        lsp.set_sign_icons({
            error = '',
            warn  = '',
            hint  = '󰥱',
            info  = '',
        })

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)
        vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
            { desc = "Expand inline error" })
    end
}
