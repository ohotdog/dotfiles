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
