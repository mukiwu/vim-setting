"// Author: Muki Wu
"// Website: http://www.mukispace.com
"// Date: 2013-10-03

"vundle setting
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"required
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'scrooloose/nerdtree.git'
Bundle 'tomtom/tcomment_vim'
Bundle 'ap/vim-css-color'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'mukiwu/vim-twig'
Bundle 'bling/vim-airline'

" vim-scripts repos
"Bundle 'Color-Scheme-Explorer'

" non github repos
"     Bundle 'git://git.wincent.com/command-t.git'

" git repos on your local machine (ie. when working on your own plugin)
"       Bundle 'file:///Users/gmarik/path/to/plugin'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed

colorscheme Tomorrow-Night-Eighties
set background=dark
set t_Co=256
syntax on
set nobackup
set tabstop=2
set shiftwidth=4
set autoindent
set smartindent
set backspace=2
set nu!
set showmatch
set mouse=a	
set ignorecase smartcase
set incsearch
set hlsearch
set cursorline
set hidden
set list
set listchars=tab:\|\ ,
syntax enable
filetype indent on
filetype plugin on
filetype plugin indent on
setlocal foldlevel=1
set foldlevelstart=99
set laststatus=2
set cmdheight=2

"plugin setting
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:neocomplcache_enable_at_startup = 1

"match
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<Esc>i<CR><CR><Esc>ki<tab>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap < <><Esc>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"  
	else
		return a:char
	endif
endf

:nmap <F2> :NERDTreeToggle<CR>
imap <c-h> <ESC>I
imap <c-l> <ESC>A
map <C-c> y
map <C-X> d
map <C-v> p
map <C-A> <Esc>ggVG
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>