require('core')
require('keybinds')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    {
        'aserowy/tmux.nvim',
        config = function() return require("tmux").setup() end
    },
    { 'ludovicchabant/vim-gutentags' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround' },
    { 'easymotion/vim-easymotion' },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' }
    },
    { 'akinsho/git-conflict.nvim', version = "", config = true },
    {
        'lewis6991/gitsigns.nvim',
        config = function() return require('gitsigns').setup() end
    },
    { 'nvim-neo-tree/neo-tree.nvim' }, 
    { 'MunifTanjim/nui.nvim' }, -- what do i need this for?
    { 'tpope/vim-fugitive' },
    { 'rmagatti/auto-session', },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    { 'stevearc/aerial.nvim' },
    { 'ThePrimeagen/harpoon' },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { 'neovim/nvim-lspconfig' },
    { 'whonore/coqtail' }, -- For Coq
    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'rafamadriz/friendly-snippets' },
    { 'github/copilot.vim' },
    { 'sbdchd/neoformat' },
    -- ###
    { 'nvim-neotest/neotest' },
    { 'olimorris/neotest-rspec' },
    { 'tpope/vim-rails' },
    { 'vim-ruby/vim-ruby' }, 
    -- ###
    {
        'simrat39/rust-tools.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'folke/todo-comments.nvim' },
    { 'goolord/alpha-nvim' },
    { 'akinsho/bufferline.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
        config = function() return require('ibl').setup() end
    },
   {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000
    }
})
require('plugins')

vim.cmd.colorscheme "catppuccin-macchiato"
