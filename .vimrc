" custom vim configuration file.

" This must be first, because it changes other options as side effect
set nocompatible
set nocp

" Runs pathogen, which is a package manager
execute pathogen#infect()

" ===============================
" Much of the following come from: http://nvie.com/posts/how-i-boosted-my-vim/

" change the mapleader from \ to ,
let mapleader=","

" maps ; to :
nnoremap ; :

" Quickly edit/reload the vimrc file
" This effectively maps the ,ev and ,sv keys to edit/reload .vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Folding shortcuts
" src: http://vim.wikia.com/wiki/Folding
:nmap ff va}zf " ff to fold by {
:nmap rr zd " rr to unfold
:nmap tt F(lvh%h "tt to select all text between ( and )

" Line moving mapping (ctrl-j, ctrl-k)
" src: http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" This hides buffers instead of closing them
set hidden

" set tabstop=2     " a tab is four spaces
filetype plugin indent on
set termguicolors
set tabstop=2
" set softtabstop=0
set shiftwidth=2
set expandtab

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show relative line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
" set smarttab    " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=100   " remember more commands and search history
set undolevels=500  " use many muchos levels of undo
set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " don't beep
set cursorline    " Highlight line the cursor is on
set mouse=a       " Allow clicking in all modes
" set selection=exclusive " When using $ to select a line (v$), do NOT select the newline character.
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

" Ale config
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:airline#extensions#ale#enabled = 1
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" ^^ This is to fix the gutter.  Weird spacing stuff when scrolling.
" I originally set these settings (specifically these bottom two) to fix it.
" But the problem returned, and commenting these two out fixed it again
" Might have to dig more if the problem returns

nmap <silent> <Left> <Plug>(ale_previous_wrap)
nmap <silent> <Right> <Plug>(ale_next_wrap)

" Gitgutter config
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '!'

" Fugitive Config
nmap <Down> <Plug>GitGutterNextHunk
nmap <Up> <Plug>GitGutterPrevHunk


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

" vim-airline
" Smarter tab line (display all buffers when only one tab is open)
let g:airline#extensions#tabline#enabled = 0

" Toggle relative/absolute line numbering
" :nmap <C-N><C-N> :set invnumber<CR>

" tsuquyomi (TypeScript server support)
" enable completion detail
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>


" Commands
command Jsonify :%!python -m json.tool

" vim-localvimrc settings
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
