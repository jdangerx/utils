call pathogen#infect()
set nocp

" tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

" search
set incsearch
set ignorecase
set smartcase

" insert remappings
imap fd <Esc>

" normal remappings
nmap j gj
nmap k gk

" line numbers
set number relativenumber
set nu rnu

" linewrap on word boundary
set wrap linebreak nolist

" color scheme
syntax enable
colorscheme base16-github

" buffers
set hidden
