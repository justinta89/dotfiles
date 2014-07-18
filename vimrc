" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif



"""""
"" Personal Modifications
"""""
" The Mouse can cause issues in some terminals. We switch it off by default.
set mouse=

" There have been security holes in the past with trojaned text files. This is
" why we switch off this option.
set nomodeline

" This makes a backup file every time you edit a file.(Those annoying files~).
" We don't want to dirty up directories. We turn it off.
set nobackup

" Having 8 spaces to represent a tab is excessive. We change this to 4 to save
" on space. Note that this is the REPRESENTATION of a tab, it does not
" actually change tabs to spaces.
set tabstop=4

"" There are numerous built-in colorschemes. Here are a few of the less
"" visually-offensive
"colorscheme desert
"colorscheme wombat
colorscheme elflord

" Menu dropdown highlighting usually involves the color pink. You can change
" almost anything in VIM; including that. We change it to more discrete
" colors.
highlight Pmenu ctermfg=black ctermbg=white

" Powerline stuff
set laststatus=2 " Always show statusline
set encoding=utf-8 " Necessary to show encoded glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors


""" Configure vundles
" 
" Install with the following:
"
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim +BundleInstall +qall
"
"
" The following are vundle settings.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" Here are some defualt plugins that add convenience for programming python.
"Bundle 'klen/python-mode.git'
"Bundle 'jmcantrell/vim-virtualenv'
Bundle 'ivanov/vim-ipython.git'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required! 
""" end vundle stuff

set nonumber

let g:pymode_python = 'python3'
let g:pymode_lint_on_fly = 1
