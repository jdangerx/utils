let mapleader=" "
nnoremap <Leader>f :Files<enter>
nnoremap <Leader>o :Buffers<enter>
nnoremap <leader>dA :r!date +'\%Y-\%m-\%d'<enter>kJ$
nnoremap <leader>s /# Stack<enter>
nnoremap <Leader>nv :NV!<enter>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:wiki_root = '~/vimwiki'
let g:wiki_filetypes = ['md']
let g:wiki_link_target_type = 'md'

function Hyphenate(text) abort
  return substitute(tolower(a:text), '\s\+', '-', 'g')
endfunction

let g:wiki_map_create_page = 'Hyphenate'
let g:wiki_map_link_create = 'Hyphenate'

let g:vim_markdown_new_list_item_indent = 2

let g:nv_search_paths = ['~/vimwiki']

set shiftwidth=2

set autowriteall
