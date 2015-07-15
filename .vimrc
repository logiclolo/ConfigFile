""""""""""""""""""""""""""""
" VIM mapping key
""""""""""""""""""""""""""""
" 
" ■ Shift: <S-...> 
" 	■Example: Shift s 
" 		<S-s>
" ■ Ctrl: <C-...> 
" ■ Alt and Meta are the same: <A-...> <M-...> 
"
" ■ <F1> through <F12>
" ■ Enter: <CR> or <Enter> or <Return> 
" ■ Space bar: <Space> 
" ■ Esc key: <Esc> 
" ■ bar ( | ), separate a mapping command from the next EX command: <BAR>
"

""""""""""""""""""""""""""""
" stop using the arrow keys
""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>




"""""""""""""""""""""""""""""
" General setting
"""""""""""""""""""""""""""""
set number
set vb
set cursorline
syntax on
set hlsearch
set autoindent
set ruler
set showmode
set tabstop=4
set shiftwidth=4
set showmatch
set noswapfile
set t_Co=256 
"comment color
highlight Comment ctermfg=cyan 
"search string color
highlight Search term=reverse ctermbg=4 ctermfg=7
set ignorecase
set smartcase
filetype plugin on

" for showmarks
let g:showmarks_include='abcdefghijklmnopqrstuvwxyz' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type="h"
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_textother="\t"
let g:showmarks_auto_toggle = 0
nnoremap <silent> mo :ShowMarksOn<CR>
nnoremap <silent> mt :ShowMarksToggle<CR>

hi ShowMarksHLl ctermfg=red   ctermbg=black
hi ShowMarksHLu ctermfg=green ctermbg=black
hi ShowMarksHLo ctermfg=red   ctermbg=black
hi ShowMarksHLm ctermfg=red   ctermbg=black

" for wokmarks
let g:wokmarks_do_maps = 0
let g:wokmarks_pool = "abcdefghijklmnopqrstuvwxyz"
map mm <Plug>ToggleMarkWok
map mj <Plug>NextMarkWok
map mk <Plug>PrevMarkWok
autocmd User WokmarksChange :ShowMarksOn

" Nerdtree stuff
nnoremap <F3> :NERDTree<CR>

" Taglist stuff
"nnoremap <F4> :TlistToggle<CR>

" Spell Check
hi SpellBad term=underline cterm=underline ctermfg=red
map <F5> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" code_complete
let g:completekey = "<tab><space>"   "hotkey

""""""""""""""""""
" mapping
""""""""""""""""""
let mapleader=","
nmap <silent> <leader>m :nohlsearch<CR>
map <F6> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>

" Use Ctrl+hjkl to switch between Window
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap - <C-w>-
nmap + <C-w>+
nmap , <C-w>>
nmap . <C-w><


"""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle  (type :PluginInstall to install plugin)
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
Plugin 'Lokaltog/vim-powerline'
"Plugin '2945235' 
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" color
Plugin 'desert256.vim'
Plugin 'Impact'
Plugin 'matrix.vim'
Plugin 'vividchalk.vim'
Plugin 'ego.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"snipmate
"Plugin "MarcWeber/vim-addon-mw-utils"
"Plugin "tomtom/tlib_vim"
"Plugin "honza/snipmate-snippets"
"Plugin "garbas/vim-snipmate"
"Plugin "bootleq/ShowMarks"
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'vim-scripts/code_complete-new-update'
Plugin 'majutsushi/tagbar'
Plugin 'clang-complete'
Plugin 'Shougo/neocomplcache'
Plugin 'ervandew/supertab'
Plugin 'mbbill/code_complete'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'git://git.wincent.com/command-t.git'
" ...
" DirDiff
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'vcscommand.vim'

" It uses signs to indicate added, modified or removed lines based on vcs
Plugin 'mhinz/vim-signify'

call vundle#end()  
filetype plugin indent on     " required!

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" 						:PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" 						auto-approve removal

""""""""""""""""""""""""""""""
" VCSCommand
""""""""""""""""""""""""""""""
nmap d <Esc>:VCSVimDiff<Enter>
filetype plugin indent on     " required!

"""""""""""""""""
" vim-powerline 
"""""""""""""""""
set t_Co=256 "Explicity tell Vim that the terminal supports 256 colors
set laststatus=2 "Always show the statusline
set encoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
set fenc=utf-8
"set guifont=Consolas\ for\ Powerline\
let g:Powerline_dividers_override = [ [0x2b80], [0x003e], [0x2b82], [0x003c] ]
let g:Powerline_symbols="fancy"
"let g:Powerline_dividers_override = [ [0x2b80], [0x003e], [0x2b82], [0x003c] ]
"let g:Powerline_symbols='fancy'


"""""""""""
" colors
"""""""""""
colorscheme wombat256  "wombat256.vim in ~/.vim/colors/



""""""""""""""""""""""""""""""""""""""""""""""
" [ Tab Operation Mac-Mapping by Klaymen ]    
""""""""""""""""""""""""""""""""""""""""""""""
nmap q <Esc>:qall<Enter>
nmap Q <Esc>:qall!<Enter>
nmap w <Esc>:close<Enter>
nmap W <Esc>:close!<Enter>
nmap s <Esc>:write<Enter>
nmap t <Esc>:tabnew<Enter> 
nmap , <Esc>:tabprev<Enter>

"ALT+ <-
nmap OD <Esc>:tabprev<Enter>

nmap . <Esc>:tabnext<Enter>
"ALT+ ->
nmap OC <Esc>:tabnext<Enter>

nmap 1 <Esc>:tabn 1<Enter>
nmap 2 <Esc>:tabn 2<Enter>
nmap 3 <Esc>:tabn 3<Enter>
nmap 4 <Esc>:tabn 4<Enter>
nmap 5 <Esc>:tabn 5<Enter>
nmap 6 <Esc>:tabn 6<Enter>
nmap 7 <Esc>:tabn 7<Enter>
nmap 8 <Esc>:tabn 8<Enter>




"tab completion
set completeopt=longest,menu,menuone
set wildmenu
"in ESC: (command mode), disbled auto completion next part, Cool!
set wildmode=list:longest


""""""""""""""""
" Diff stuff
""""""""""""""""
" highlight diff color
hi diffchange ctermbg=236
hi diffadd ctermbg=4
hi DiffDelete ctermfg=69 ctermbg=234
hi difftext ctermbg=3 ctermfg=0

" WinMerge-style (Alt + hjkl) mapping for vimdiff
nmap j ]c
nmap k [c

" Diff mode: Used to do diffput and diffget
" Switch key mapping in Left/Right window under DiffMode
if has("autocmd")
	autocmd BufEnter,BufLeave *
		\ if &diff                                                 |
		\     if winnr() == 1                                      |
		\        nmap g do                                       |
		\        nmap ; dp                                       |
		\     else                                                 |
		\        nmap g dp                                       |
		\        nmap ; do                                       |
		\     endif                                                |
		\ endif
endif

""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""
" Set tags path
set tags=tags,../tags,../../tags

""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""
" init cscope hotkey
function! UseAwesomeCscope()
	let l:srcdir=(isdirectory("../src") ? '../' : './')
	try
		"set tags+=$HOME/horus/apps/tags
		exe "cs add " . l:srcdir . "cscope.out " . l:srcdir
		exe "cs add $HOME/Horus/apps/cscope.out $HOME/Horus/apps"
		"exe "cs add /home/kent.chen/cscope_ctag/Horus/cscope.out /home/kent.chen/Project/Horus/apps"
	catch /duplicate/
		silent exe "!tag_rebuild " . l:srcdir
		silent exe "cs reset"
		exe "redraw!"
		echohl Wildmenu | echo "cscope database inuse, update and re-init all connections" | echohl None
	catch /stat/
		silent exe "!tag_rebuild " . l:srcdir
		try
			exe "cs add " . l:srcdir . "cscope.out " . l:srcdir
			exe "cs add $HOME/Horus/apps/cscope.out $HOME/Horus/apps"
			"exe "cs add /home/kent.chen/cscope_ctag/Horus/cscope.out /home/kent.chen/Project/Horus/apps"
			exe "redraw!"
			echohl Wildmenu | echo "cscope file not found, exec tag_rebuild" | echohl None
		catch
			exe "redraw!"
			echohl ErrorMsg | echo "You don't have enough privilege XD, just add Horus db." | echohl None
			exe "cs add $HOME/Horus/apps/cscope.out $HOME/Horus/apps"
			"exe "cs add /home/kent.chen/cscope_ctag/Horus/cscope.out /home/kent.chen/Project/Horus/apps"
		endtry
	endtry
endfun
nnoremap <F11> <ESC>:call UseAwesomeCscope()<CR>


""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""
nmap <F12>   :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" Clang-Completion
""""""""""""""""""""""""""""""
"let g:clang_complete_auto=1
"let g:clang_auto_select = 1
"let g:clang_use_library=1
"let g:clang_library_path=$HOME."/usr/lib"
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_periodic_quickfix=1
"let g:clang_hl_errors=1
"let g:clang_snippets_engine='snipmate'
"let g:clang_complete_copen=1

""""""""""""""""""""""""""""""
" NeoComplCache
""""""""""""""""""""""""""""""
"let g:neocomplcache_enable_at_startup = 0
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1

"" snippets expand trigger with ,,
"imap ,, <esc>a<Plug>snipMateTrigger

"map <F4> :NeoComplCacheEnable<CR>
"map ,<F4> :NeoComplCacheToggle<CR>

""""""""""""""""""""""""""""""
" vim-signify
""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git', 'svn' ]
