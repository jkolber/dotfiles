filetype indent plugin on
syntax enable
set nocompatible
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
set noshowmode
set notitle
set number
set rnu
set ruler
" set scrolloff=15
" set scroll=5
set shiftround
set shiftwidth=2
set shortmess+=A
set showbreak=
set showcmd
set showmatch
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
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rhubarb'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
call plug#end()
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
command! NT NERDTree
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

" Lightline
" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ 'active': {
" \   'left': [['mode', 'paste'], ['filename', 'modified']],
" \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
" \ },
" \ 'component_expand': {
" \   'linter_warnings': 'LightlineLinterWarnings',
" \   'linter_errors': 'LightlineLinterErrors',
" \   'linter_ok': 'LightlineLinterOK'
" \ },
" \ 'component_type': {
" \   'readonly': 'error',
" \   'linter_warnings': 'warning',
" \   'linter_errors': 'error'
" \ },
" \ }

" function! LightlineLinterWarnings() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
" endfunction
"
" function! LightlineLinterErrors() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
" endfunction
"
" function! LightlineLinterOK() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '✓ ' : ''
" endfunction
"
" " Update and show lightline but only if it's visible (e.g., not in Goyo)
" function! s:MaybeUpdateLightline()
"   if exists('#lightline')
"     call lightline#update()
"   end
" endfunction
"
" " Update the lightline scheme from the colorscheme. Hopefully.
" function! s:UpdateLightlineColorScheme()
"   let g:lightline.colorscheme = g:colors_name
"   call lightline#init()
" endfunction

" augroup _lightline
"   autocmd!
"   autocmd User ALELint call s:MaybeUpdateLightline()
"   autocmd ColorScheme * call s:UpdateLightlineColorScheme()
" augroup END

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
    autocmd bufwritepost .vimrc nested source ~/.vimrc
augroup END

runtime macros/matchit.vim
