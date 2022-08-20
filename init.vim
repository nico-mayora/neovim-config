" Neovim configuration.
" Huge thank you to every FOSS contributor who made this editor a reality.
" Nicolás Mayora 2021-2022.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Highlight yanked text
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Use persistent history
set undodir=~/.config/nvim/undodir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug for Plugin Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" {{ Basic utilities }}
    Plug 'nvim-telescope/telescope.nvim'                        " Fuzzy finder
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
    Plug 'ludovicchabant/vim-gutentags'                         " Tag generation and maintainance
    Plug 'nvim-lua/plenary.nvim'                                " Lua functions
    Plug 'tpope/vim-commentary'                                 " For Commenting gcc
    Plug 'tpope/vim-surround'                                   " Surround commands
    Plug 'tpope/vim-endwise'                                    " Autoappend do, then, end, etc
    Plug 'easymotion/vim-easymotion'                            " Better motion
" {{ Productivity }}
    Plug 'kyazdani42/nvim-tree.lua'                             " Fs explorer
    Plug 'tpope/vim-fugitive'                                   " Git integration
    Plug 'tpope/vim-obsession'                                  " Better session management
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'folke/trouble.nvim'                                   " Diagnostics view
" {{ LSP & autocompletion }}
    Plug 'neovim/nvim-lspconfig'                                " LSP config
    Plug 'williamboman/nvim-lsp-installer'                      " Gui for managing lsp servers
    " Misc. autocomplete sources
    Plug 'hrsh7th/cmp-nvim-lsp'                         
    Plug 'hrsh7th/cmp-buffer'                                  
    Plug 'hrsh7th/cmp-path'                                     
    Plug 'hrsh7th/nvim-cmp' 
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'                         " Snippets support
    Plug 'github/copilot.vim'                                   " Copilot integration
    Plug 'sbdchd/neoformat'                                     " Autoformatting
" {{ Work-specific }}
    Plug 'antoinemadec/FixCursorHold.nvim'                      " Workaround fix
    Plug 'nvim-neotest/neotest'                                 " Testing framework
    Plug 'olimorris/neotest-rspec'                              " Rspec adapter
    Plug 'tpope/vim-rails'                                      " rails utilities
    Plug 'vim-ruby/vim-ruby'                                    " Ruby integration
" {{ Appearance }}
    Plug 'goolord/alpha-nvim'                                   " Fancy startup
    Plug 'akinsho/bufferline.nvim'                              " Better buffline
    Plug 'nvim-lualine/lualine.nvim'                            " Bottom bar
    Plug 'kyazdani42/nvim-web-devicons'                         " Better icons
    Plug 'lukas-reineke/indent-blankline.nvim'                  " Indentation guides
    Plug 'sainnhe/gruvbox-material'                             " Gruvbox with treesitter support
    Plug 'https://gitlab.com/__tpb/monokai-pro.nvim'            " Monokai pro theme
    Plug 'navarasu/onedark.nvim'                                " Onedark theme
    Plug 'folke/lsp-colors.nvim'                                " LSP colours

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Run configuration for lua plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('nvim-tree_cfg')
require('nvim-cmp')
require('lualine_cfg')
require('lsp_cfg')
require('buffline_cfg')
require('treesitter')
require('telescope_cfg')
require('startup_cfg')
require('neotest_cfg')
require("trouble").setup()
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimL configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Snippets
if (&ft=='rb')
    :let g:vsnip_filetypes.ruby = ['rails']
endif

" LSP & formatter
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

" Vim-cmp
    "see lua file for more
set completeopt=menu,menuone,noselect

" GitHub Copilot
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'ruby': v:true,
      \ }

" Gutentags
let g:gutentags_enabled = 0
" let g:gutentags_project_root = ['Gemfile'] 

" Easymotion config
let g:EasyMotion_do_mapping = 1

" Folding
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set current theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
let g:onedark_config = {
    \ 'style': 'cool',
\}
colorscheme onedark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configure custom mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

nnoremap k gk
nnoremap j gj

imap jk <Esc>
imap kj <Esc>
nnoremap <leader>b :ls<CR>:b<Space>
tnoremap <Esc> <C-\><C-n>
noremap <space> :

"Navigate open buffers
nnoremap <leader>d :bp<CR>
nnoremap <leader>f :bn<CR>

map <F5> :source Session.vim<CR>
map <F9> :nohl<CR>
map <F10> :wa<CR>
nnoremap <F8> <cmd>lua require('neotest').summary.toggle()<cr>

nnoremap <leader>ss <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>g :Telescope live_grep<CR>
nnoremap <C-P> :Telescope find_files<CR>

" Custom commands
command Nt :NvimTreeFocus
command Fmt :Neoformat

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Trouble keymaps
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
