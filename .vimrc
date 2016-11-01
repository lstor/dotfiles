" Author: Lars Storjord
" Contact: lars@lstor.me
" Website: http://lstor.me
" Repository: https://github.com/lstor/vimfiles-lstor
"
" Note: If you get an error message about swapfiles or backup files, make sure
" the directories ~/.vim/backup and ~/.vim/tmp exist. See set directory and set
" backupdir. The setup.py script bundles with vimfiles-lstor will setup the
" directories automatically.

" Issues: If you have any problems or issues, please report them at the issue
" tracker on github. Make sure to note which OS and Vim version you are using.

" Latin1_Keys: {{
if has("win32")
  scriptencoding latin1
endif

let mapleader = "ø"

" Make some buttons more feasible on scandinavian keyboards
" n - normal mode, x - visual mode, o - operator pending mode
" c - command line mode

" å
nmap å [
xmap å [
omap å [
cmap å [
" Å
nmap Å ]
xmap Å ]
omap Å ]
cmap Å ]
" æ
nmap ææ ``
nmap æ `
xmap æ `
omap æ `
cmap æ `
" Æ
nmap ÆÆ ''
nmap Æ '
xmap Æ '
omap Æ '
cmap Æ '

" }}

" -----------------------------------------------------------------------------

" Utf-8 from here on out {{
scriptencoding utf8
set enc=utf-8
setl fileencoding=utf-8
setl fileencodings=utf-8,latin1,default

" }}

set nocompatible " vim is 'vi improved' for a reason...

" Vundle: {{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" original repos on github
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
"Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'groenewege/vim-less'
Plugin 'godlygeek/tabular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'lrvick/Conque-Shell'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'skammer/vim-css-color'
Plugin 'slashmili/alchemist.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" vim-scripts repos
Plugin 'FuzzyFinder'
Plugin 'HTML-AutoCloseTag'
Plugin 'L9'
Plugin 'bufexplorer.zip'
Plugin 'matchit.zip'

" TODO:
" - SearchComplete

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()

filetype plugin indent on       " use file specific plugins and indents
"}}

" -----------------------------------------------------------------------------

" Appearance: {{
set t_Co=256                    " use 256 colors
silent! colorscheme desert      " fallback for non-256 color terminals
colorscheme solarized
syntax match vimSynType /^set .*/
syntax on                       " use syntax highlighting

" Avoid resizing existing windows
if !exists('g:vimrc_loaded')
  set lines=25 columns=108
end
" }}

" -----------------------------------------------------------------------------

" Options: {{
" ----------

"set shortmess=a0stT
set autochdir                   " cd to dir of current file
set autoindent                  " indenting
set autoread                    " automatically re-read when file is changed
set backspace=indent,eol,start  " smart backspacing
set nobackup                    " don't make backup
set backupdir=~/.vim/backup     " directory for backups
set bg=dark                     " used with color scheme
set cindent                     " indenting
set clipboard+=unnamed          " share windows clipboard
set colorcolumn=80,100          " Highlight right margins
set nocopyindent                " follow previous indent level
set cpoptions=aABceFsq          " compatibility options, rtfm
set nocursorcolumn              " highlight current column
set nocursorline                " underline the current line
set directory=~/.vim/tmp        " directory for swapfiles
set noerrorbells                " no noise, please
set expandtab                   " convert tabs to spaces
set noexrc                      " use local version of .(g)vimrc, .exrc
set fileformats=unix,dos        " LF all the way, baby
set fileformat=unix             " ------ '' ------
set foldenable                  " not quite sure...
set foldlevel=100               " don't have anything folded at the beginning
set formatoptions+=ro
set hidden                      " allow implicit hidden buffers
set history=50                  " remember 50 commands
set hlsearch                    " highlight search
set ignorecase                  " case insensitive
set incsearch                   " search while typing
set infercase                   " case inferred
set laststatus=2                " if == 2, use status bar
set lazyredraw                  " lazy screen redraw (faster)
set linespace=0                 " no extra space between lines
set list                        " show chars indicated by listchars
set listchars=tab:>·,trail:·    " show tabs and trailing whitespace
set magic                       " use default escaping of search chars
set matchpairs=(:),{:},[:],<:>  " matching pairs for use with % (see matchit)
set matchtime=2                 " tenths of a second to show matching brackets
set mouse=a                     " enable mouse
set number                      " line numbers
set report=0                    " report changes via :...
set ruler                       " status bar
set scrolloff=5                 " scroll at this distance from top/bottom
set shiftround                  " be clever with tabs
set shiftwidth=4                " used with autoindenting
set showbreak=                  " dont indicate long lines
set showcmd                     " show current command
set showmatch                   " show matching parenthesis
set showmode                    " show current mode (insert etc.)
set sidescrolloff=5             " scroll at this distance from left/right (?)
set smartcase                   " ignore case except when.. uh, :help smartcase
set smartindent                 " indenting
set smarttab                    " indenting
set softtabstop=4               " insert four spaces when I hit tab
set splitright                  " new split windows appear on the right
set startofline                 " automatically move cursor to start of line
set noswapfile                  " don't use a swap file
set tabstop=8                   " an actual tab is eight spaces
set textwidth=79                " generate newline at col 79
set visualbell                  " blink on error (se autocmd below)
set wildignore=.dll,.o,.obj,    " do not list these file extensions
              \.bak,.exe,.pyc,.jpg,.gif,.png,.wmv,.pdf,.avi,.mpg,
              \.divx,.so,.a
set wildmenu                    " command line completion wild style
"set wildmode=list:longest
set wildmode=longest:full,full
set wmh=0                       " window minimum height is 0, rather than 1 line
set nowrap                      " wrap text around
" }}

" -----------------------------------------------------------------------------

" Plugin_configuration: {{

" Airline:
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" CtrlP:
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" DelimitMate:
let delimitMate_quotes = ""

" EasyMotion:
let g:EasyMotion_leader_key = '<Leader><Leader>'

" Gitgutter:
" Disable gitgutter realtime to fix bug.
let g:gitgutter_realtime = 0

" Gundo:
let g:gundo_prefer_python3 = 1

" Ultisnips:
let g:UltiSnipsUsePythonVersion = 2

" }}

" -----------------------------------------------------------------------------

" Variables: {{
" ------------

" Use CSS and XHTML with :TOhtml
let html_use_css=1
let use_xhtml=1

" }}

" -----------------------------------------------------------------------------

" Mappings: {{
" -----------

" Credits
nmap <Leader>l :echoerr " .vimrc by Lars Storjord"<CR>

" Platform dependent mappings
if has("mac")
elseif has("unix")
elseif has("win32")
  inoremap jj <Esc>
endif

" Unused leader mappings:
"   c e g ijkl  opqrs uvw yz
" ABCDE G IJKLMNOPQRSTUVWXYZ
" 0123456789!"#$%&/()=?-_*@

" Redo paste properly
nnoremap <silent> <Leader>a u:set paste<CR>.:set nopaste<CR>gi

" Edit .vimrc
nnoremap <silent> <Leader>b :e! ~/.bashrc<CR>

" Execute my program
nnoremap <silent> <Leader>d :Dispatch<CR>

nnoremap <silent> <Leader>e :EvaluateLine<CR>

nmap <silent> <Leader>f <Leader><Leader>f
nmap <silent> <Leader>F <Leader><Leader>F

" Find next digit on this line
nnoremap <silent> <Leader>g :call search("[0-9]", "",  line("."))<CR>

" Find previous digit on this line
nnoremap <silent> <Leader>G :call search("[0-9]", "b", line("."))<CR>

" Remove search highlights
nnoremap <silent> <Leader>h :nohls<CR>

" Set search highlights
nnoremap <silent> <Leader>H :set hls!<CR>

" Set spaces for indentation
nnoremap <silent> <Leader>i :call SetIndentation()<CR>

" Call Make
nnoremap <silent> <Leader>m :Make<CR>

" Toggle Nerdtree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

inoremap <silent> <C-N> <C-x><C-o>

" Toggle Tagbar
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" Edit .vimrc
nnoremap <silent> <Leader>v :e! $MYVIMRC<CR>

" Swap buffer
nnoremap <silent> <Leader>x   :b#<CR>

" Other mappings
" --------------

" Make space in normal mode go down a screenfull
nnoremap <space> <C-f>

" Insert a single character without entering insert mode.
nnoremap  <silent> <Leader><TAB> :exe "normal i".nr2char(getchar())<CR>

" Use arrow keys for something more useful
nnoremap <silent> <Left>     :prev<CR>
nnoremap <silent> <Right>    :next<CR>
nnoremap <silent> <Up>       <nop>
nnoremap <silent> <Down>     <nop>

" Apply rot13 to entire file, in case you're writing something secret :-)
" Note: Uses mark y
noremap <silent> <F12> myggg?G`y
" }}

" -----------------------------------------------------------------------------

" Symbols: {{
inoreabbr mforall ∀
inoreabbr mexists ∃
inoreabbr melemin ∈
inoreabbr mnotelemnin ∉
inoreabbr mgrequal ≥
inoreabbr mlequal ≤
inoreabbr mnequal ≠
inoreabbr mlogor ∧
inoreabbr mlogand ∨
inoreabbr mlognot ¬
inoreabbr mimplies ⇒
inoreabbr mifthen →
inoreabbr miff ⇔
inoreabbr mequiv ≡
inoreabbr mdefinedas ≜
inoreabbr mxor ⊕
inoreabbr msum ∑
inoreabbr mprod ∏
inoreabbr minfinite ∞
inoreabbr mintersect ∩
inoreabbr munion ∪
inoreabbr msqrt √
inoreabbr mtherefore ∴
inoreabbr samfisher ∴
inoreabbr mdelta ∂
" }}

" -----------------------------------------------------------------------------

" Autocommands: {{
" ---------------

" Define a augroup to prevent redefining the commands.
augroup vimrc_filetype
  autocmd!

  " .vimrc
  " Automatically source upon write
  au BufWritePost ~/.vimrc :source %
  au BufWritePost ~/_vimrc :source %
augroup end

autocmd GUIEnter * set noerrorbells visualbell t_vb=

" Mark the 51th column (for git commit summary messages)
augroup gitcommit_filetype
  autocmd!
  au FileType gitcommit :set cc=51,72
augroup end
" }}

" -----------------------------------------------------------------------------

" Commands: {{
" Use 'Calc' to perform calculation using python
command! -nargs=+ Calc :py print <args>
command! -nargs=1 UioEdit :e scp://larsstor@login.ifi.uio.no//uio/arkimedes/s27/larsstor/<args>
command! -nargs=1 ObEdit  :e scp://lstor@lstor.openbastille.org//usr/home/lstor/<args>
command! -nargs=0 ResetWindowSize :set lines=25 columns=108
command! -nargs=0 EvaluateLine :call EvaluateLine()
" }}

" -----------------------------------------------------------------------------

" Functions: {{
function! EvaluateLine()
  let line = getline(".")
  $put =eval(line)
endfunction

function! SetIndentation()
  let choices = "&2 spaces\n&4 spaces\n&8 spaces\n&tabs"
  let choice = confirm("Set indentation to ...", choices)

  " Indentation: 2
  if choice == 1
    set expandtab sts=2 sw=2

  " Indentation: 4
  elseif choice == 2
    set expandtab sts=4 sw=4

  " Indentation: 8
  elseif choice == 3
    set expandtab sts=8 sw=8

  " Indentation: tabs
  elseif choice == 4
    set noexpandtab sts=8 sw=8

  " Default: 4
  else
    set expandtab sts=4 sw=4

  endif
endfunction
" }}

" -----------------------------------------------------------------------------

" Gvim: {{
if has("gui_running")
  set guioptions+=a
  set guioptions+=c
  set guioptions-=m
  set guioptions-=b
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=f
  set guioptions-=e
  set mousehide

  if has("win32")
      set guifont=Consolas:h14:cANSI
      set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
  else
    set guifont=Inconsolata:h15
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
  endif
endif
" }}

" -----------------------------------------------------------------------------

" Local: {{
if filereadable(expand('$HOME/.localchanges.vimrc'))
  exec 'source ' . fnamemodify(expand('$HOME/.localchanges.vimrc'), ':p')
endif

" Source local Vundle plugins
if filereadable(expand('$HOME/.localplugins.vimrc'))
  exec 'source ' . fnamemodify(expand('$HOME/.localplugins.vimrc'), ':p')
endif

" }}

lcd ~
let g:vimrc_loaded = 1

" vim:fdm=marker:fmr={{,}}:fcl=all:fdl=0:ts=2:sw=2:sts=2:

