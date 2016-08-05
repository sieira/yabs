set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/Vundle.vim'

" The bundles you install will be listed here
Bundle 'powerline/powerline', {'rtp':  'powerline/bindings/vim'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'leshill/vim-json'
Bundle 'StanAngeloff/php.vim'
Bundle 'davidhalter/jedi-vim'

filetype plugin indent on

" Powerline setup
set t_Co=256
set laststatus=2

" Nerd tree
map <F2> :Lexplore<CR>

" Tabulations
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0 "Disable rope in favour of jedi-vim

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_options_max_line_length = 100

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=Red guibg=Red ctermfg=Yellow guifg=Yellow
    autocmd FileType python match Excess /\%101v.*/
    autocmd FileType python set nowrap
    augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding and unfolding
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding and unfolding
map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=syntax<cr>zR<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual style
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :set number! relativenumber!<cr>
set relativenumber  " Show relative line numbers
set number          " But keep showing the current line number
" set cursorline    " Underline current line
set wrap
set scrolloff=3     " Always show at least three lines around the cursor
set textwidth=100
set formatoptions=qrn1
" set colorcolumn=100
colorscheme desert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TROLL ALERT: Disable keyboard arrows
" (get used to the home line, you yerk)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
" Kept on insert mode for autocompletion, but seriously, just don't use them
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sanitize and clean files
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistant undo file
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" ????????????????????????????????????????
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" set ruler           " Unneeded with powerline
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start

call vundle#end()
