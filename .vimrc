let mapleader=" "
nnoremap <Leader>o :Files<enter>
nnoremap <Leader>b :Buffers<enter>
nnoremap <leader>dA :r!date +'\%Y-\%m-\%d'<enter>kJ$
nnoremap <Leader>nv :NV!<enter>
nnoremap <Leader>ni :NV<enter>inbox

call plug#begin('~/.vim/plugged')
Plug 'jdangerx/readthecomments'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'alok/notational-fzf-vim'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-sneak'

call plug#end()

let g:vim_markdown_new_list_item_indent = 2
let g:nv_search_paths = ['~/work/foam', '~/notes']

set shiftwidth=2

set autowriteall

colorscheme readthecomments

if has("nvim")
  set inccommand=nosplit
endif


