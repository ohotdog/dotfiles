" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" turn on syntax highlighting
syntax on
" show line number
set number
" disable auto insert of comment leaders
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" keep buffers in background
set hidden

" set unix line endings
set fileformat=unix

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" reload files changed outside vim
set autoread

" utf 8 encoding
set encoding=utf-8
set fileencoding=utf-8

" tab sizes
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" set incremental search
" aka: jump to results while typing
set incsearch

" set minimum amount of lines above or below cursor
" aka: see more info when i'm zippin around
set scrolloff=8

"----------------mcantor thoughtbot talk--------------
" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

"   :find tab completing file search
"   :b autocomplete open buffer
"   :ls list open buffers
"   ^n autocomplete
"   ^x^n just current file
"   ^x^f for filename (or path)
"   :help
"   :helpgrep
"   cl, cn, cp, cc<#> to navigate helpgrep
