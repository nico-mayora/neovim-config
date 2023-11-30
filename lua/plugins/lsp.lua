require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", },
}

-- require('lspconfig')['hls'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
   flags = lsp_flags,
}

vim.diagnostic.config({ virtual_text = false,}) -- Turn off inline diagnostics
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="cursor"})')
vim.o.updatetime = 200
