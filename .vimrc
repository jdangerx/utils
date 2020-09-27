let mapleader=" "
nnoremap <Leader>o :Files<enter>
nnoremap <Leader>b :Buffers<enter>
nnoremap <leader>dA :r!date +'\%Y-\%m-\%d'<enter>kJ$
nnoremap <Leader>nv :NV!<enter>
nnoremap <Leader>ni :NV<enter>inbox

let g:vim_markdown_new_list_item_indent = 2
let g:nv_search_paths = ['~/work/foam', '~/notes']

set shiftwidth=2

set autowriteall

set background=dark

if has("nvim")
  set inccommand=nosplit
endif
