vim.cmd([[
    command! SyncLSPs MasonInstall
    \ efm
    \ lua-language-server
    \ bash-language-server
    \ shellcheck
    \ mypy
    \ ruff-lsp
    \ marksman
    \ codelldb
    \ jedi-language-server
    \ rust-analyzer
]])
