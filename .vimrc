execute pathogen#infect()
set nocp

" indentation
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent

" c
autocmd FileType c setlocal cindent
" python
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" search
set incsearch
set ignorecase
set smartcase

" insert remappings
inoremap fd <Esc>
inoremap df <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" normal remappings
nnoremap j gj
nnoremap k gk

" leader
let mapleader = " "
let maplocalleader = " "

" line numbers
set number relativenumber
set nu rnu

" linewrap on word boundary
set wrap linebreak nolist

" color scheme
filetype plugin indent on
syntax on
colorscheme base16-github

" buffers
set hidden

" file finding
set autochdir
nnoremap <leader>ff :FZF ~<enter>

" search
set hlsearch
nnoremap <leader>sc :nohl<enter>

" C shortcut
nnoremap <leader>cc :w<enter>:!c99 -o %:r -g3 -Wall -pedantic %<enter>

nnoremap <leader>dA :r!date<enter>kJ$

" trailing whitespace
set list listchars=trail:·,extends:>
