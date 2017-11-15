" Csaba Palankai <csaba.palankai@gmail.com>

" Don't be compatible with original vi. Must be first, changes other settings
set nocompatible

" right mouse button extends selection instead of context menu
set mousemodel=extend

" shift plus movement keys changes selection
set keymodel=startsel,stopsel

" allow cursor to be positioned one char past end of line
" and apply operations to all of selection including last char
set selection=exclusive

" allow backgrounding buffers without writing them
" and remember marks/undo for backgrounded buffers
set hidden

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Command line height
set cmdheight=1

" 256 colours
set t_Co=256

" Enable syntax highlighting
syntax on

" Show cursor position on the status
set ruler


set helplang=en
set history=500

" highlight last search matches
set hlsearch
set incsearch
set termencoding=utf-8
set updatetime=500
set wildmenu
set relativenumber
set smartindent
set noswapfile
set foldlevel=99
set foldmethod=indent

set showmatch
set ignorecase
set smartcase

set shiftround
set mouse=a

set colorcolumn=80

" sane text files
set fileformat=unix
set fileformats=unix,mac,dos
set encoding=utf-8

" sane editing
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

