require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

vim.diagnostic.config({ virtual_text = false,}) -- Turn off inline diagnostics
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="cursor"})')
vim.o.updatetime = 200

-- require'lspconfig'.solargraph.setup{}
require'lspconfig'.hls.setup{}
