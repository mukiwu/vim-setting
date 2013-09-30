"------------  Author: Muki Wu
"------------ Website: http://www.mukispace.com
"------------    Date: 2013-09-30

"基本設定
colorscheme Tomorrow-Night-Eighties
set background=dark
"colorscheme seoul256
"let g:seoul256_background = 235			" range 234(darkest) ~ 239 (lightest) (default:237)
set t_Co=256												 " 讓 terminal 支援 256 色
set guifont=Ubuntu\ Mono:h12				 " 字型設定 Ubuntu Mono , 12 號
set writebackup
set nobackup												 " 覆蓋文件時不要備份
set tabstop=2												 " 設定 tab 鍵的寬度
set shiftwidth=4										 " 換行時行間交錯使用 4 個空格
set autoindent											 " 自動對齊
set smartindent											 " 智能自動縮進
set backspace=2											 " backspace 可用
set cindent shiftwidth=2						 " 設定縮進 4 個空格
set nu!															 " 顯示行號
set showmatch												 " 顯示括號配對
set mouse=a													 " 啟用滑鼠
set ignorecase smartcase						 " 搜索時忽略大小寫，但是如果有一個或以上大寫字母時就不會忽略
set incsearch												 " 快速找關鍵字
set hlsearch												 " 高亮搜尋的關鍵字
set cursorline											 " 凸出顯示當前行
set hidden													 " 可以在未保存修改時，切換緩衝區
set list														 " 顯示 Tab，用高亮以及 - 代替
set listchars=tab:\|\ ,
syntax enable												 " 打開語法高亮
syntax on														 " 開啟文件類型偵測高亮
filetype indent on									 " 針對不同的文件，採不同的縮進格式
filetype plugin on									 " 針對不同的文件類型，載入對應的插件
filetype plugin indent on						 " 啟用自動補全
set foldenable											 " 折疊
set foldmethod=indent								 " 使用縮進折疊
set foldcolumn=0										 " 折疊區域的寬度
setlocal foldlevel=1								 " 折疊層數
set foldlevelstart=99								 " 默認不折疊 (zc關閉折疊/zo打開折疊/za互相切換)
set laststatus=2
set cmdheight=2

"vundle
set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
	 
" let Vundle manage Vundle
" required! 
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
"   Bundle 'FuzzyFinder'

" non github repos
"     Bundle 'git://git.wincent.com/command-t.git'

" git repos on your local machine (ie. when working on your own plugin)
"       Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required!
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed

"插件
let g:Powerline_symbols = 'fancy'							" 開啟 Powerline 的箭頭
call pathogen#runtime_append_all_bundles()		" pathogen 插件管理
let g:cssColorVimDoNotMessMyUpdatetime = 1		" css color 直接顯示在 code 上
let g:neocomplcache_enable_at_startup = 1			" 自動完成

"引號, 括號自動匹配
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

"Ctrl + H = home
imap <c-h> <ESC>I
"Ctrl + L = end
imap <c-l> <ESC>A

"設定快速鍵
:nmap <F2> :NERDTree<CR> " F2 啟動 NERDTree
map <C-c> y				 " ctrl+c 複製
map <C-X> d				 " crtl+x 剪下
map <C-v> p				 " crtl+v 貼上
map <C-A> <Esc>ggVG		 " crtl+a 全選
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>	"空白鍵開關折疊
