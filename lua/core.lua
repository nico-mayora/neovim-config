vim.g.mapleader = ","
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100
vim.opt.iskeyword:remove { "_" }

vim.opt.undodir = '/home/nico/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.termguicolors = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.g.copilot_filetypes = {
    ['*'] = false,
    ['ruby'] = true,
    ['haskell'] = true,
    ['rust'] = true,
}

vim.g.gutentags_enabled = 1
vim.g.gutentags_project_root = { 'Gemfile' }

vim.g.neoformat_enabled_ruby = { 'rubocop' }
vim.g.neoformat_enabled_haskell = { 'stylishhaskell' }

vim.g.EasyMotion_do_mapping = 1

vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#88088F', })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = 'DarkOrange', })
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = 'Blue', })
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = 'Green', })

vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnoticWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticHint"})

vim.cmd([[
    highlight clear CursorLine
    hi CursorLineNr term=bold cterm=bold ctermfg=010 gui=bold

    " Highlight yanked text
    augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup END

    " Snippets "
    if (&ft=='rb')
       :let g:vsnip_filetypes.ruby = ['rails']
    endif

    " LSP & formatter "
    autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
]])


