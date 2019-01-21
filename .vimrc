" Plugin repos
" pathogen: https://github.com/tpope/vim-pathogen
" syntastic: https://github.com/vim-syntastic/syntastic
" vim-tmux-navigator: https://github.com/christoomey/vim-tmux-navigator
" vim-slime: https://github.com/jpalardy/vim-slime
" vim-colorschemes: https://github.com/flazz/vim-colorschemes
" YouCompleteMe: https://github.com/Valloric/YouCompleteMe
" nerdcommenter https://github.com/scrooloose/nerdcommenter
" nerdtree https://github.com/scrooloose/nerdtree
" vim-flake8 https://github.com/nvie/vim-flake8

execute pathogen#infect()

syntax on
filetype plugin on
colorscheme jellybeans
highlight Comment cterm=italic gui=italic

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set noerrorbells novisualbell         " Turn off visual and audible bells
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere

au BufNewFile,BufRead *.c setlocal tabstop=3 softtabstop=3 shiftwidth=3 autoindent
au BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent 
au BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent 
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent colorcolumn=80 

set ruler
set number
set cursorline
set scrolloff=5
set laststatus=2
set encoding=utf8
set sidescrolloff=10
set whichwrap+=<,>,[,]

if has('mouse')                       " Enable the mouse if supported
  set mouse=a
endif

set nofoldenable
set foldnestmax=5
set foldmethod=indent

" Persistent undo
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undo/

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/tmp/*
set wildignore+=*/node_modules/
set wildignore+=*/vendor/bundle/*

" let python_highlight_all=1

" Plugins
map <C-n> :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" Flake8 for Vim
" autocmd BufWritePost *.py call Flake8()

let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_c_checkers = ['cpp']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

" Open NERDTree directory on 'vim' without specified file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Disable syntastic python
" let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
  if !empty(a:errors)
    let g:syntastic_loc_list_height = min([len(a:errors), 10])
  endif
endfunction
