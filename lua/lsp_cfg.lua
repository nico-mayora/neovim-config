vim.diagnostic.config({ virtual_text = false,}) -- Turn off inline diagnostics
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope="cursor"})')
vim.o.updatetime = 200

require'lspconfig'.solargraph.setup{}
require'lspconfig'.hls.setup{}
