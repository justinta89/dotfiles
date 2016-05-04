set nocompatible	" For Vundle
filetype off		" For Vundle

"" General
set number	" Show line numbers
set wrap	" wraps lines
" set textwidth=80	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set list!
set listchars=tab:>.,trail:- "show tabs and extra spaces
set expandtab	" changes tab to spaces

set cursorline
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Colors
set background=dark
colorscheme base16-ocean
let base16colorspace=256

"" Vundle Settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'saltstack/salt-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'dag/vim-fish'
Plugin 'junegunn/goyo.vim'

call vundle#end()

" --- CtrlP settings ---
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" --- NERDTree Settings ---
" Start Nerdtree with vim
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if Nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree Tabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_synchronize_view=1

" -- Disable NerdTree when in Goyo --
function! s:goyo_enter()
    silent !NERDTree set status off
    set noshowmode
    set noshowcmd
endfunction

" -- Reenable NerdTree when exit Goyo --
function! s:goyo_leave()
    silent !NERDTree set status on
    set showmode
    set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


filetype plugin indent on
syntax on
