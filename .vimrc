" custom vim configuration file.

" This must be first, because it changes other options as side effect
set nocompatible

" Runs pathogen, which is a package manager
execute pathogen#infect()

" ===============================
" The following come from: http://nvie.com/posts/how-i-boosted-my-vim/

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
" This effectively maps the ,ev and ,sv keys to edit/reload .vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" This hides buffers instead of closing them
set hidden

" set tabstop=2     " a tab is four spaces
filetype plugin indent on
set tabstop=2
" set softtabstop=0 
set shiftwidth=2 
set expandtab 



set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
" set smarttab      " insert tabs on the start of a
										"    line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
" set wildignore=*.swp,*.bak,*.pyc,*.class " ignores things
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
nnoremap ; : 
                 " remaps from : to ;
" Easy window navigation (play later)
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

cmap w!! w !sudo tee % >/dev/null
  " (when foregetting sudo), you can use !! after the command.
" ==============================

" Press enter to create a new line, shift-enter to create a new line
" above.
nmap <CR> o<Esc>


" For the solarized colorscheme
syntax enable
" set background=dark
" colorscheme solarized

" Fixes wonky pasting
" set paste
