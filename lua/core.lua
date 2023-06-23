-- TODO: Refactor
vim.cmd([[
    set number
    set cursorline
    highlight clear CursorLine
    hi CursorLineNr term=bold cterm=bold ctermfg=010 gui=bold
    set mouse=a
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set noshowmode
    set signcolumn=yes
    set updatetime=100
    let mapleader = ","
    set iskeyword-=_

    " Highlight yanked text
    augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup END

    " Use persistent history
    set undodir=~/.config/nvim/undodir
    set undofile


    " Snippets "
    if (&ft=='rb')
        :let g:vsnip_filetypes.ruby = ['rails']
    endif

    " LSP & formatter "
    autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

    hi DiagnosticError guifg=#88088F
    hi DiagnosticWarn guifg=DarkOrange
    hi DiagnosticInfo guifg=Blue
    hi DiagnosticHint guifg=Green

    sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=
    sign define DiagnosticSignWarn  text= texthl=DiagnosticWarn  linehl= numhl=
    sign define DiagnosticSignInfo  text= texthl=DiagnosticInfo  linehl= numhl=
    sign define DiagnosticSignHint  text= texthl=DiagnosticHint  linehl= numhl=

    let g:neoformat_enabled_ruby = ['rubocop']
    let g:neoformat_enabled_haskell = ['stylishhaskell']

    " Vim-cmp "
        "see lua file for more "
    set completeopt=menu,menuone,noselect

    " GitHub Copilot "
    let g:copilot_filetypes = {
          \ '*': v:false,
          \ 'ruby': v:true,
          \ 'haskell': v:true,
          \ }

    " Gutentags "
    let g:gutentags_enabled = 1
    let g:gutentags_project_root = ['Gemfile'] 

    " Easymotion config "
    let g:EasyMotion_do_mapping = 1
]])


