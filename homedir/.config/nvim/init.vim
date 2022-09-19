
" FONT TEST START
"
" console.log "oO08 iIlL1 g9qCGQ ~-+=>";

"
" FONT TEST END

" HELP vim START
"
"### VIM REMAPING
" inoremap	-- insert mode non recursive mapping
" 
" inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
"
" 	if pressed <c-b> in insert mode
" 		quit insert mode <Esc>,
" 		run :Lex<cr> command, and then
" 		run :vertical resize 30
"
"### VIM FILE MANAGERS
"
" netrw > Nerdtree > Fern > CoCExplorer
"
" HELP vim END

call plug#begin()

" console.log "oO08"
Plug 'liuchengxu/vim-which-key'		" Based on plugin 'hecal3/vim-leader-guide'
Plug 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'		" easy comments
Plug 'itchyny/lightline.vim'		" statusbar
Plug 'NLKNguyen/papercolor-theme'	" theme

Plug 'lambdalisue/nerdfont.vim'		" NerdFont for Fern icons
Plug 'lambdalisue/fern.vim'		" fern
Plug 'lambdalisue/fern-renderer-nerdfont.vim'	" for Fern icons

call plug#end()

" Get syntax files from config folder
" set runtimepath+=~/.config/nvim/syntax

" general
colorscheme PaperColor
set background=dark
set number relativenumber
set nowrap
set clipboard=unnamed

" Disable C-z from job-controlling neovim
nnoremap <c-z> <nop>

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Syntax highlighting
syntax on

" default file encoding
set encoding=utf-8

" Plugins config
source ~/.config/nvim/vim-which-key.vimrc 
source ~/.config/nvim/tmux-seamless-navigation.vimrc
source ~/.config/nvim/coc-newconfig.vimrc
source ~/.config/nvim/vimwiki.vimrc
source ~/.config/nvim/commentary.vimrc
source ~/.config/nvim/fern.vimrc

" " coc-python
" set statusline^=%{coc#status()}

" enable 'gf' for current file and all traversing downwords
set path+=.,**

