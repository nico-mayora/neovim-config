" [Basic config]
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

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" [Plugins]
call plug#begin()
" vim-cmp & vsnip
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'neovim/nvim-lspconfig' " lsp
Plug 'nvim-lualine/lualine.nvim' " bottom bar
Plug 'kyazdani42/nvim-web-devicons' " better icons
Plug 'akinsho/bufferline.nvim' " better buffline
Plug 'tpope/vim-fugitive' " Git integration (for airline)
Plug 'lukas-reineke/indent-blankline.nvim' "Indentation guides
Plug 'tpope/vim-obsession' " Better session management
Plug 'tpope/vim-surround' "Surround commands
Plug 'ludovicchabant/vim-gutentags' "Tag generation and maintainance
Plug 'https://github.com/vim-ruby/vim-ruby' "Ruby integration
Plug 'https://github.com/tpope/vim-commentary' "For Commenting gcc
Plug 'rafi/awesome-vim-colorschemes' "colour schemes
Plug 'preservim/nerdtree' "fs explorer
Plug 'https://github.com/tpope/vim-rails' "rails utilities
Plug 'https://github.com/tpope/vim-endwise' "autoappend do, then, end, etc
Plug 'easymotion/vim-easymotion' "better motion
Plug 'https://github.com/ryanoasis/vim-devicons' "Developer Icons
Plug 'nvim-lua/plenary.nvim' " Lua functions
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
Plug 'sainnhe/gruvbox-material' " gruvbox with treesitter support
" telescope fzf behaviour
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } 
Plug 'github/copilot.vim' " Copilot integration
Plug 'https://gitlab.com/__tpb/monokai-pro.nvim' " good theme
Plug 'vlime/vlime', {'rtp': 'vim/'} " Common lisp integration

Plug 'sbdchd/neoformat' " formatting

call plug#end()

" [snippets]
if (&ft=='rb')
    :let g:vsnip_filetypes.ruby = ['rails']
endif

" [LSP & formatter]
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

let g:neoformat_enabled_ruby = ['rubocop']

" [Vim-cmp]
set completeopt=menu,menuone,noselect
"see lua file for more

" [Copilot]
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'ruby': v:true,
      \ }

" [Gutentags]
let g:gutentags_enabled = 1
let g:gutentags_project_root = ['Gemfile'] 

" [Easymotion config] 
let g:EasyMotion_do_mapping = 1

" [Use persistent history]
set undodir=~/.config/nvim/undodir
set undofile

" [Set theme] vimcolorschemes.com
" Also github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
" Good ones -> anderson, sonokai, gruvbox, palenight, monokai
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        diagnostics = "lsp",
        buffer_close_icon = '', 
    }
}
EOF

" let g:gruvbox_material_palette = 'hard'
" colorscheme gruvbox-material
" let g:airline_theme = "gruvbox"

let g:monokaipro_filter = 'machine'
colorscheme monokaipro

" [Folding]
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" [Treesitter]
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "haskell", "ruby" },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" [Telescope]
lua << EOF
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local telescope = require "telescope"

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      -- "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    color_devicons = true,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- this is default
    },
  },
}

require("telescope").load_extension "fzf"
EOF

" [Custom mappings]
let mapleader = ","
nnoremap k gk
nnoremap j gj
imap jk <Esc>
imap kj <Esc>
nnoremap <leader>b :ls<CR>:b<Space>
tnoremap <Esc> <C-\><C-n>
noremap <space> :
command Nt :NERDTree
command Fmt :Neoformat
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <leader>g :Telescope live_grep<CR>
nnoremap <leader>d :bp<CR>
nnoremap <leader>f :bn<CR>
map <F5> :source Session.vim<CR>
map <F9> :nohl<CR>
map <F10> :wa<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
