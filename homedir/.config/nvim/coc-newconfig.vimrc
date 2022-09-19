


" Enter key autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" CTRL+J and CTRL+K to traverse the completion list
inoremap <expr> <C-j> coc#pum#visible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? "\<C-P>" : "\<C-k>"







