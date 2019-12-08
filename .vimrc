set nocompatible
filetype off
syntax on

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'klen/python-mode'
Bundle 'elzr/vim-json'
Bundle 'StanAngeloff/php.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'digitaltoad/vim-pug'
Bundle 'majutsushi/tagbar'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'vimwiki/vimwiki'
Bundle 'NewProggie/NewProggie-Color-Scheme'
Bundle 'artur-shaik/vim-javacomplete2'
Bundle 'mrk21/yaml-vim'
Bundle 'maxmellon/vim-jsx-pretty'

let mapleader = ","
let g:mapleader = ","

filetype plugin indent on

" Airline
let g:airline_theme='simple'

" Nerd tree
map <F2> :NERDTreeToggle<CR>

" Ctags
nmap <F3> :TagbarToggle<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" yml stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType typescript set tabstop=2
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java set tabstop=4
autocmd FileType java set shiftwidth=4
autocmd FileType java set softtabstop=4
autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:pymode_python = 'python3'

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_options_max_line_length = 100

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'import sys; import pdb; pdb.Pdb(stdout=sys.__stdout__).set_trace()  # XXX breakpoint a la cool'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jade / Pug stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.pug setlocal ft=pug
au BufNewFile,BufRead *.jade setlocal ft=pug

au FileType pug setl sw=2 sts=2 et

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.{ts,tsx} setlocal filetype=typescript

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding and unfolding
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't autofold code
let g:pymode_folding = 0
" Folding and unfolding
map <leader>f :set foldmethod=indent<cr>zM<cr>
map <leader>F :set foldmethod=syntax<cr>zR<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual style
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>l :set number! relativenumber!<cr>
set relativenumber  " Show relative line numbers
set number          " But keep showing the current line number
" set cursorline      " Underline current line
set wrap
set scrolloff=3
set textwidth=100
set formatoptions=qrn1
set colorcolumn=0

colorscheme newproggie

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=Red guibg=Red
    autocmd FileType python match Excess /\%101v.*/
    autocmd FileType python set nowrap
    augroup END

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
" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

set encoding=utf-8
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.tsx :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo file and centralized swap
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undo//
set directory=~/.vim/swp//

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vmwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:automatic_nested_syntaxes=1

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
