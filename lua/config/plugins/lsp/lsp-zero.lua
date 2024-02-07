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
        lsp.preset('recommended')
        lsp.setup()
        lsp.set_sign_icons({
            error = '',
            warn  = '',
            hint  = '󰥱',
            info  = '',
        })
        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['rust_analyzer'] = { 'rust' },
                ['clangd'] = { 'c', 'cpp' },
                ['lua-ls'] = { 'lua' },
                ['ruff_lsp'] = { 'python' }
            }
        })

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)
        vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
            { desc = "Expand inline error" })
    end
}