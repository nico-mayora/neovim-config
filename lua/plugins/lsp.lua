require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}

require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "hls", "ocamllsp" },
}

local lspconfig = require('lspconfig')

lspconfig.hls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.clangd.setup {
    on_attach = on_attach,
   flags = lsp_flags,
}

lspconfig.ocamllsp.setup {
    on_attach = on_attach,
}

vim.diagnostic.config({ virtual_text = false,}) -- Turn off inline diagnostics
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="cursor"})')
vim.o.updatetime = 200
