
" By default timeoutlen is 1000 ms
set timeoutlen=500

" let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}

let g:which_key_map['a'] = {
	\ 'name' : '+admin',
	\ 'c' : [':checkhealth'			      , 'vim-checkhealth']	,
	\ 'd' : [':e $MYVIMRC'			      , 'edit-vimrc']		,
	\ 'r' : [':update | so $MYVIMRC'	, 'reload-vim-config']	,
	\ }

let g:which_key_map['f'] = {
	\ 'name' : '+file',
	\ 'x' : [':update | !bash %'		  , ':bash %']	,
	\ 'p' : [':update | !python3 %'		, ':python3 %']	,
	\ 'q' : [':quit'			, ':quit']	,
	\ 's' : [':update'			, 'save buffer']	,
	\ 'e' : [':Fern . -drawer -reveal=%'	, 'filemanager']	,
	\ }

" other version of toggling FERN
" noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

" let g:which_key_map.l = {
"       \ 'name' : '+lsp',
"       \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
"       \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
"       \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
"       \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
"       \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
"       \ 'g' : {
"         \ 'name': '+goto',
"         \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
"         \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
"         \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
"         \ },
"       \ }

let g:which_key_map['q'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'j' : [':resize +5' , 'expand-window-below']   ,
      \ 'l' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'k' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'o' : [':tab split' ,'tab split']	       ,
      \ }





