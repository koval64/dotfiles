

" Fern config

let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 0

noremap <silet> <A-f> :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
	nmap <buffer> H <Plug>(fern-action-open:split)
	nmap <buffer> V <Plug>(fern-action-open:vsplit)
	nmap <buffer> T <Plug>(fern-action-open:tabedit)
	nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-new-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	" nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
	nmap <buffer> v <Plug>(fern-action-mark)
endfunction

augroup fern-custom
	autocmd! *
	autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
augroup END

