set scrolloff=8
set guicursor=v-n-i:block
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
set shell=cmd
set wildignore=*/node_modules/*,*/target/*,*/tmp/*
set clipboard+=unnamedplus
set foldmethod=syntax

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'kemiller/vim-ir_black'
Plug 'duane9/nvim-rg'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

call plug#end()


" This was from the colorscheme section
colorscheme ir_black

" Our remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <Leader><CR> :so  ~/.dotfiles/nvim/init.vim<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>z :Files<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>f=
nnoremap <leader>fb :Telescope file_browser<CR>

lua << EOF
    require("telescope/custom-picker")
EOF
