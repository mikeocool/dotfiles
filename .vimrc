set nocompatible
set background=dark

if has("syntax")
    syntax on
endif

set encoding=utf-8

set hidden                          "allow hiding buffers with unsaved changes
set showmode                        "show edit mode at bottom of screen
set showcmd                         "shows command in bottom right
set rnu                             "show line numbers
set ruler                           "always show cursor position
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab                       "tabs to spaces
set smarttab
set backspace=indent,eol,start      "backspace through everything in insert mode
set noerrorbells                    "No error bells
set visualbell t_vb=                "No visual bell
set scrolloff=5                     "Make sure you always get 5 lines visually around the cursor when scrolling
set autoread                        "Automatically realod files when they're changed by an external program

set hlsearch			    "Highlight search matches
set incsearch		            "Search as you type
set ignorecase			    "Ignore case while searching
set smartcase			    "Don't ignore case if the search term isn't all lowercase

""make line numbers grey
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

""Backup
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Make funny character show up red
highlight NonText ctermfg=DarkRed


" show line number of current line, and relative line numbers
set rnu
set nu
