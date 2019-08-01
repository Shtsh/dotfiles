call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'baskerville/bubblegum'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
" Google plugins for coverage
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
Plug 'google/vim-glaive'
Plug 'kien/ctrlp.vim'
"Plug 'lambdalisue/vim-pyenv', {'for': ['python', 'python3']}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvie/vim-flake8'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-syntastic/syntastic'
call plug#end()


" Fancy colors
if (has("termguicolors"))
    set termguicolors
endif
set t_Co=256
colorscheme one
let g:airline_theme='one'
set background=dark

" General settings
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
let g:python_highlight_all=1
syntax on
set colorcolumn=120
set nu

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


function MyCustomHighlights()
	hi semshiUnresolved      ctermfg=red guifg=#e06c75
	hi semshiImported        ctermfg=214 guifg=#56b6c2 gui=none
	hi semshiGlobal          ctermfg=214 guifg=#56b6c2 gui=none
	hi semshiSelf            ctermfg=249 guifg=#777777 gui=none
	hi semshiBuiltin         ctermfg=249 guifg=#56b6c2 gui=bold
	hi semshiParameter       ctermfg=75  guifg=#61afef
	hi semshiParameterUnused ctermfg=117 guifg=#777777 cterm=underline gui=underline
	hi semshiAttribute       ctermfg=117 guifg=#61afef
endfunction
let g:semshi#excluded_hl_groups = ['local', 'unresolved', 'free']
autocmd FileType python call MyCustomHighlights()
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

""""""""""""""""""""""""""""""""""""""""""
" avoid extraneous whitespace
:highlight ExtraWhitespace ctermbg=darkgreen guibg=yellow
au BufRead,BufNewFile * match ExtraWhitespace /\s\+$/


" Git Gutter
set updatetime=100

let mapleader = " "
" Split navigation
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>v <C-W><C-V>

nnoremap <leader>qq :qa!<CR>
nnoremap <leader>f zA
nnoremap <leader>ww :xa!<CR>
nnoremap <leader>T :NERDTreeToggle<CR>
silent! map <leader>t :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode = "<leader>t"
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
nnoremap <leader>hh <C-^>
