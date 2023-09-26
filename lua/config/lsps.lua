vim.cmd([[
    command! SyncLSPs MasonInstall
    \ efm
    \ lua-language-server
    \ bash-language-server
    \ shellcheck
    \ mypy
    \ pyright
    \ ruff-lsp
    \ marksman
]])
