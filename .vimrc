" Plugin repos
" pathogen: https://github.com/tpope/vim-pathogen
" syntastic: https://github.com/vim-syntastic/syntastic
" vim-tmux-navigator: https://github.com/christoomey/vim-tmux-navigator
" vim-slime: https://github.com/jpalardy/vim-slime
" vim-colorschemes: https://github.com/flazz/vim-colorschemes
" YouCompleteMe: https://github.com/Valloric/YouCompleteMe
" nerdcommenter https://github.com/scrooloose/nerdcommenter
" nerdtree https://github.com/scrooloose/nerdtree

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
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection

set ruler
set number
set tabstop=2
set shiftwidth=2
set encoding=utf8
set autoindent
set cursorline
set scrolloff=5
set laststatus=2
set sidescrolloff=10
set whichwrap+=<,>,[,]

if has('mouse')                       " Enable the mouse if supported
  set mouse=a
endif

set nofoldenable
set foldnestmax=5
set foldmethod=indent

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

" Plugins
map <C-n> :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
  if !empty(a:errors)
    let g:syntastic_loc_list_height = min([len(a:errors), 10])
  endif
endfunction
