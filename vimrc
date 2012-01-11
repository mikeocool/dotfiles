call pathogen#infect()

set background=dark
color desert
syntax on
filetype plugin indent on

set nocompatible
set encoding=utf-8

set showmode                        "show edit mode at bottom of screen
set showcmd                         "shows command in bottom right
set number                          "show line numbers
set ruler                           "always show cursor position
set nowrap
set tabstop=4 shiftwidth=4
set expandtab                       "tabs to spaces
set backspace=indent,eol,start      "backspace through everything in insert mode
set noerrorbells                    "No error bells

set hlsearch
set incsearch
set ignorecase
set smartcase

""make line numbers grey
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

""Autocomplete
set wildmode=longest,list "first tab does partial completion, 2nd shows list
set wildmenu "enables tab completion

""Backup
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""GUI Only
set antialias
if has("gui_running")
    set guioptions=-t
endif

"Single character insert
nmap <Space> i_<Esc>r
