let mapleader=" "
nnoremap <Leader>f :Files<enter>
nnoremap <Leader>o :Buffers<enter>
nnoremap <leader>dA :r!date +'\%Y-\%m-\%d'<enter>kJ$
nnoremap <leader>s /# Stack<enter>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:wiki_root = '~/vimwiki'
let g:wiki_filetypes = ['md']

function Hyphenate(text) abort
  return substitute(tolower(a:text), '\s\+', '-', 'g')
endfunction

let g:wiki_map_create_page = 'Hyphenate'
let g:wiki_map_link_create = 'Hyphenate'

set autowriteall
