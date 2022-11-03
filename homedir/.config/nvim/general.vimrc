
" enable 'gf' for current file and all traversing downwords
set path+=.,**

" Get syntax files from config folder
" set runtimepath+=~/.config/nvim/syntax

" General
colorscheme PaperColor
set background=dark
set number relativenumber
set nowrap
set clipboard=unnamed

set ignorecase		" always case insensitive

set autoindent		" auto-indent new lines
set expandtab		" use spaces instead of tabs
set shiftwidth=4	" number of auto-indent spaces
set smartindent		" enable smart-indent
set smarttab		" enable smart-tabs
set softtabstop=4	" number of spaces per tab

" Advanced

set autochdir
" set autowriteall

set backspace=indent,eol,start	" backspace behavior

" Disable C-z from job-controlling neovim - for vim-commentary
nnoremap <c-z> <nop>

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Type a replacement term and press "." to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Prevent x and the delete key from overriding what's in the clipboard
" (suppose) cons : disallow you to swap two a json characters
noremap x "_x
noremap X "_x
noremap <Del> "_x

" Keep cursor at the bottom of the visual selection after you yank it.
" vmap y ygv<Esc>

" Toggle spell check.
map <F8> :setlocal spell!<CR>

" Syntax highlighting
syntax on

" default file encoding
set encoding=utf-8

" tab navigation
" open new tab
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>
" move to previous/next tab
nnoremap <C-n> :tabprevious<CR>
nnoremap <C-p> :tabnext<CR>













