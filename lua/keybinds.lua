-- TODO: Refactor into proper lua
vim.cmd([[
    nnoremap k gk
    nnoremap j gj

    imap jk <Esc>
    imap kj <Esc>
    tnoremap <Esc> <C-\><C-n>
    nnoremap <space> :
    nnoremap <C-Space> za
    nnoremap <C-n> :Neotree<CR>

    " Go to definition "
    nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap ^] gd
    nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>

    " Navigate open buffers "
    nnoremap <leader>d :bp<CR>
    nnoremap <leader>f :bn<CR>

    map <F5> :source Session.vim<CR>
    map <F9> :nohl<CR>
    map <F10> :wa<CR>
    nnoremap <F8> <cmd>lua require('neotest').summary.toggle()<CR>

    nnoremap <leader>ss :lua require('telescope.builtin').treesitter()<cr>
    nnoremap <leader>r :Telescope registers<cr>
    nnoremap <leader>b :Telescope buffers<cr>
    nnoremap <leader>g :Telescope live_grep<CR>
    nnoremap <leader>a :AerialToggle!<CR>
    nnoremap <leader>t :TroubleToggle<CR>
    nnoremap <C-P> :Telescope find_files<CR>

    " Custom commands "
    command Nt :Neotree
    command Fmt :Neoformat
    " Temp: "
    command Nht :lua require('rust-tools').inlay_hints.disable()
    command Yht :lua require('rust-tools').inlay_hints.enable()

    " Use ctrl-[hjkl] to select the active split "
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
]])
