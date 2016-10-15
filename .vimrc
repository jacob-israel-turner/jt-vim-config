" custom vim configuration file.

" This must be first, because it changes other options as side effect
set nocompatible
set nocp

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
set number " always show relative line numbers
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

" Copy to 'clipboard registry' by default
set clipboard=unnamedplus

" 'Select all' napping
nmap <C-a> ggVG

" theme stuff stuff

" alduin theme settings
let g:alduin_Shout_Become_Ethereal = 1

" sierra theme settings

" backgrounds (lighter to darker)
" let g:sierra_Sunset = 1
" let g:sierra_Twilight = 1
let g:sierra_Midnight = 1
" let g:sierra_Pitch = 1

" let g:sierra_Campfire = 1
let g:sierra_Nevada = 1
" let g:sierra_Clear_Skies = 1

" default theme set:
colorscheme nova


" On save, remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" syntastic recommended settings (see https://github.com/scrooloose/syntastic#3-recommended-settings)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_html_checkers=['']

" ctrl-p
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Above ^^ should ignore all files matched in the .gitignore file.  Doesnt
" seem to work now.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cmd = 'CtrlPMixed'

" nerdcommentor - ,c<space> to toggle selected
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Toggle relative/absolute line numbering
" :nmap <C-N><C-N> :set invnumber<CR>

" Folding shortcuts
" src: http://vim.wikia.com/wiki/Folding
:nmap ff va}zf " ff to fold by {
:nmap rr zd " rr to unfold
