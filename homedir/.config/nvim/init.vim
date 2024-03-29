



" F4    -- toggle Fern
" F5    -- toggle inlay hint ( Coc plugin )
" F8    -- toggle word spellcheck




" FONT TEST START
" console.log "oO08 iIlL1 g9qCGQ ~-+=>";
" FONT TEST END

" vim HELP START
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
" netrw > Nerdtree > Fern > CoCExplorer
" vim HELP END

call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'folke/which-key.nvim'             " leader key bindings
Plug 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'		" easy comments
Plug 'itchyny/lightline.vim'		" statusbar
Plug 'NLKNguyen/papercolor-theme'	" theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lambdalisue/fern.vim'		" fern
Plug 'lambdalisue/nerdfont.vim'		" NerdFont for Fern icons
Plug 'lambdalisue/fern-renderer-nerdfont.vim'	" for Fern icons

call plug#end()

" Plugins configs
source ~/.config/nvim/which-key.vimrc 
source ~/.config/nvim/tmux-seamless-navigation.vimrc
source ~/.config/nvim/coc.vimrc
source ~/.config/nvim/vimwiki.vimrc
source ~/.config/nvim/commentary.vimrc
source ~/.config/nvim/disable-netrw.vimrc
source ~/.config/nvim/fern.vimrc
source ~/.config/nvim/fzf.vimrc

" Vim settings
source ~/.config/nvim/general.vimrc

