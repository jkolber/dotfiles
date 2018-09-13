filetype indent plugin on
syntax on
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cindent
set cinkeys-=0#
set cmdheight=2
set copyindent
set clipboard=unnamed
set directory-=.
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set matchtime=2
set modelines=5
set mouse=a
set number
set ruler
" set scrolloff=15
set scroll=5
set shiftround
set shiftwidth=2
set shortmess+=A
set showbreak=
set showmatch
set notitle
set showcmd
set softtabstop=2
set smartcase
set textwidth=100
set tags=./tags
set ttimeoutlen=100
execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
call plug#end()
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
command NT NERDTree
" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Make sure colored syntax mode is on, and make it Just Work with newer 256
" color terminals like iTerm2.
set background=dark
let g:rehash256 = 1
colorscheme molokai
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

" Automagically reload vimrc on changes
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

runtime macros/matchit.vim
