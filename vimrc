set nocompatible
set background=dark
color desert
syntax on
filetype plugin indent on

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
   set guioptions-=T
endif

"Single character insert
nmap <Space> i_<Esc>r

" \ is the leader character
let mapleader = ","

" Hide search highlighting
map <Leader>h :set invhls <CR>

" prepopulate command line with :e <current file directory>
map <leader>ew :e <C-R>=expand("%:p:h")."/"<CR>

" toggle between relative and actual line numbers
function! g:ToggleNuMode() 
    if(&rnu == 1) 
        set nu 
    else 
        set rnu 
    endif 
endfunc 

nnoremap <C-L> :call g:ToggleNuMode()<cr> 
