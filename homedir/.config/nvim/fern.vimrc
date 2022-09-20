

" Fern config

let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 0
let g:fern#disable_default_mappings = 1

" toggle Fern
noremap <silent> <tab> :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
        nmap <buffer> H <Plug>(fern-action-open:split)
        nmap <buffer> V <Plug>(fern-action-open:vsplit)
	nmap <buffer> T <Plug>(fern-action-open:tabedit)
        nmap <buffer> r <Plug>(fern-action-reload)
	nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-new-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	" nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
        " nmap <buffer> d <Plug>(fern-action-remove)
	nmap <buffer> v <Plug>(fern-action-mark)
        nmap <buffer> h <Plug>(fern-action-collapse)
        nmap <buffer> l <Plug>(fern-action-open-or-expand)
        nmap <buffer><nowait> < <Plug>(fern-action-leave)
        nmap <buffer><nowait> > <Plug>(fern-action-open-or-enter)
        nmap <buffer><nowait> <backspace> <Plug>(fern-action-leave)
        nmap <buffer><nowait> <enter> <Plug>(fern-action-open-or-enter)
endfunction

augroup FernGroup
  autocmd! *
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call FernInit()
augroup END









