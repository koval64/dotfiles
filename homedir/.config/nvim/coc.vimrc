
"
" set (g:coc_node_path) variable to specify which (node) executable to start
" coc.nvim service from
"


" Enter key autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" CTRL+J and CTRL+K to traverse the completion list
inoremap <expr> <C-j> coc#pum#visible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? "\<C-P>" : "\<C-k>"


" " coc-python
" set statusline^=%{coc#status()}





