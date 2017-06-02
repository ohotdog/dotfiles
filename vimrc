" unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" don't make vim compatible with vi
set nocompatible

" turn on syntax highlighting
syntax on
" show line number
set number

" try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" enable matchit plugin to enhance '%'
runtime macros/matchit.vim

" backspace deletes line breaks and automatically-
" inserted indentation
set backspace=indent,eol,start

" keep buffers in background
set hidden

" set unix line endings
set fileformat=unix

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers
" or other non-typed comments
set lazyredraw

" reload files changed outside vim
set autoread

" utf 8 encoding
set encoding=utf-8
set fileencoding=utf-8

" always show status bar
set laststatus=2

"--------------------customization--------------------
" mostly (entirely) stolen from gosukiwi
" keep cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4

" no lines longer than 80 cols
set textwidth=80

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

"------------------plugin configuration---------------
" set the runtime path include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" start plugin definition
Plugin 'Lokaltog/vim-powerline'

" end plugin definition
call vundle#end()

filetype plugin indent on
