" Author: lstor <lstor@users.noreply.github.com>
" Repository: https://github.com/lstor/dotfiles
"
" Note: If you get an error message about swapfiles or backup files, make sure
" the directories ~/.vim/backup and ~/.vim/tmp exist. See set directory and set
" backupdir. The setup.py script bundled with vimfiles-lstor will setup the
" directories automatically.

" Issues: If you have any problems or issues, please report them at the issue
" tracker on github. Make sure to note which OS and Vim version you are using.

set nocompatible " not really needed, but just in case we use ancient Vim

" Leader: {{
let mapleader = ","
nnoremap \ ,
" }}

" -----------------------------------------------------------------------------

" Utf-8 from here on out {{
set encoding=utf-8
scriptencoding utf8
setl fileencoding=utf-8
setl fileencodings=utf-8,latin1,default

" }}

" -----------------------------------------------------------------------------

" Vundle: {{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" original repos on github
"Plugin 'airblade/vim-gitgutter'

Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'kyuhi/vim-emoji-complete'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'slashmili/alchemist.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-scripts repos
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
if !exists('g:vimrc_loaded') && has('gui_running')
  set lines=25 columns=108
end
" }}

" -----------------------------------------------------------------------------

" Options: {{
" ----------

" Note: Comments below usually explain what the 'set' version of boolean
" options do.  So 'set noautochdir' is explained with 'cd to current file' even
" though the setting is turned *off*.

"set shortmess=a0stT
set noautochdir                 " cd to current file
set autoindent                  " copy indent from current line on newline
set autoread                    " automatically re-read when file is changed
set backspace=indent,eol,start  " smart backspacing
set nobackup                    " make backup files
set backupdir+=~/.vim/backup    " directory for backups
set bg=dark                     " used with color scheme, light/dark
set browsedir=current           " dir to use for file browser
set cindent                     " indenting
set clipboard+=unnamed          " share windows clipboard
set colorcolumn=+1,100          " highlight tw=1 and column 100
set conceallevel=2              " hide concealed text unless replaced
set noconfirm                   " ask if :q etc. should write to file
set cpoptions=aABceFsqZ         " compatibility options, rtfm
set cryptmethod=blowfish2       " use slightly less obsolete crypto
set nocursorcolumn              " highlight current column
set nocursorline                " underline the current line
set directory=~/.vim/tmp        " directory for swapfiles
set noerrorbells                " no noise, please
set expandtab                   " convert tabs to spaces
set noexrc                      " use local version of .(g)vimrc, .exrc
set fileformats=unix,dos        " LF all the way, baby
set fileformat=unix             " ------ '' ------
set foldclose=all               " auto-close folds beyond current foldlevel
set nofoldenable                " start with folds open (toggle with zi)
set foldlevel=0                 " initial fold-level (0 = all closed)
set formatoptions+=ro
set hidden                      " allow implicit hidden buffers
set history=1000                " number of ex commands to remember
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
set report=0                    " always report number of lines changed
set ruler                       " show cursor coordinates
set scrolloff=2                 " scroll at this distance from top/bottom
set shiftround                  " be clever with tabs
set shiftwidth=4                " used with autoindenting
set shortmess+=I                " skip intro (if we don't have startify)
set showbreak=                  " dont indicate long lines
set showcmd                     " show current command
set showmatch                   " show matching parenthesis
set showmode                    " show current mode (insert etc.)
set sidescroll=1                " minimal number of columns to scroll
set sidescrolloff=5             " minimum columns of context to show
set smartcase                   " ignore case except pattern has upper case
set smartindent                 " try to be smart with C indenting
set smarttab                    " be clever about how to insert tabs
set softtabstop=4               " insert four spaces when I hit tab
set splitright                  " new split windows appear on the right
set startofline                 " automatically move cursor to start of line
set noswapfile                  " don't use a swap file
set t_vb=                       " disable visual bell
set tabstop=8                   " an actual tab is eight spaces
set textwidth=79                " generate newline at col 79
set tildeop                     " make ~ behave like an operator
set notimeout                   " combined with 'set ttimeout', don't make
set ttimeout                    " mapped keys time out.
set ttyfast                     " yeah, no, the 80s are over.
set virtualedit=block           " allow virtual edits in these cases
set visualbell                  " blink on error instead of beeping
set wildmenu                    " command line completion with menu
set wildmode=list:longest,full  " first try to list the matches, then show menu
set wmh=0                       " window minimum height is 0, rather than 1 line
set nowrap                      " wrap text around

set wildignore=.dll,.o,.obj,    " do not list these file extensions
              \.bak,.exe,.pyc,.jpg,.gif,.png,.wmv,.pdf,.avi,.mpg,
              \.divx,.so,.a
" }}

" -----------------------------------------------------------------------------

" Plugin_configuration: {{

" Airline: {{
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" }}

" CtrlP: {{
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }}

" DelimitMate: {{
" remove <> from DelimitMate,<:>
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""
" }}

" EasyMotion: {{
let g:EasyMotion_leader_key = '<Leader><Leader>'
" }}

" Gitgutter: {{
" Disable gitgutter realtime to fix bug.
let g:gitgutter_realtime = 0
" }}

" Gundo: {{
let g:gundo_prefer_python3 = 1
" }}

" Tagbar: {{
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }
" }}

" Ultisnips: {{
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsUsePythonVersion = 3
" }}

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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

" Possible leader mappings:
" abcdefghijklmnopqrstuvwxyz
" ABCDEFGHIJKLMNOPQRSTUVWXYZ
" 0123456789!"#$%&/()=?-_*@
"
" Use :map <leader> to show current mappings with <leader>.

" Redo paste properly
nnoremap <silent> <Leader>a u:set paste<CR>.:set nopaste<CR>gi

" Execute my program
nnoremap <silent> <Leader>d :Dispatch<CR>

" e -- edit {{
" Edit .bashrc
nnoremap <silent> <Leader>eb :e! ~/.bashrc<CR>

" Edit .gitconfig
nnoremap <silent> <Leader>eg :e! ~/.gitconfig<CR>

" Edit .ssh/config
nnoremap <silent> <Leader>es :e! ~/.ssh/config<CR>

" Edit .tmux.conf
nnoremap <silent> <Leader>et :e! ~/.tmux.conf<CR>

" Edit .vimrc
nnoremap <silent> <Leader>ev :e! $MYVIMRC<CR>
" }}

" Actually use 'nmap' to allow easymotion to pick it up
" (Greetings to Fyodor)
nmap <silent> <Leader>f <Leader><Leader>f
nmap <silent> <Leader>F <Leader><Leader>F


" g -- Golang {{
nnoremap <silent> <Leader>gd :GoDoc<CR>
nnoremap <silent> <Leader>gi :GoImports<CR>
nnoremap <silent> <Leader>gl :GoLint<CR>
nnoremap <silent> <Leader>gt :GoTest<CR>
nnoremap <silent> <Leader>gv :GoVet<CR>
" }}


" Find next digit on this line
" nnoremap <silent> <Leader>g :call search("[0-9]", "",  line("."))<CR>

" Find previous digit on this line
" nnoremap <silent> <Leader>G :call search("[0-9]", "b", line("."))<CR>

" Remove search highlights
nnoremap <silent> <Leader>h :nohls<CR>

" q -- plugins (no mnemonic, just easy to reach) {{
" Toggle Nerdtree
nnoremap <silent> <Leader>qn :NERDTreeToggle<CR>

" Toggle Tagbar
nnoremap <silent> <Leader>qt :TagbarToggle<CR>
" }}

" u -- utilities {{
nnoremap <silent> <Leader>ue :EvaluateLine<CR>
" }}

" Swap buffer
nnoremap <silent> <Leader>x :b#<CR>

" z -- for settings {{

" Set search highlights
nnoremap <silent> <Leader>zh :set hls!<CR>

" Set spaces for indentation
nnoremap <silent> <Leader>zi :call SetIndentation()<CR>

" Easily change leader
nnoremap <silent> <Leader>zl :call SetLeader()<CR>

" }}

" Other mappings
" --------------

" Make space in normal mode go down a screenfull
nnoremap <space> <C-f>

" Insert a single character without entering insert mode.
nnoremap  <silent> <Leader><TAB> :exe "normal! i".nr2char(getchar())<CR>

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

augroup go_filetype
  autocmd!
  " auto-format go code
  au FileType go :setl listchars=tab:\ \ ,trail:·
  au FileType go :setl noexpandtab sts=4 sw=4 ts=4
augroup end
" }}

" -----------------------------------------------------------------------------

" Commands: {{
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

function! SetLeader()
  let choices = "&US layout\n&EU layout"
  let choice = confirm("Set leader to ...", choices)

  if choice == 1
    let mapleader = ';'
  else
    let mapleader = 'ø'
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

" Nvim: {{
if has('nvim')
  :tnoremap <Esc> <C-\><C-n>
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :nnoremap <A-h> <C-w>h
  :nnoremap <A-j> <C-w>j
  :nnoremap <A-k> <C-w>k
  :nnoremap <A-l> <C-w>l
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

if has("win32") && !exists('g:vimrc_loaded')
  lcd ~
endif

let g:vimrc_loaded = 1

" vim:fen:fdm=marker:fmr={{,}}:fcl=all:fdl=0::ts=2:sw=2:sts=2:

