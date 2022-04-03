set termguicolors
set fencs=utf-8,sjis
set ts=4 sts=4 sw=4 et

set laststatus=2
set autoindent
set smarttab
set smartindent
augroup c_cpp_parenindent
  autocmd!
  autocmd FileType c,cpp setlocal cindent cinoptions=(1s
augroup END

set wildmenu

set incsearch
set inccommand=split
set smartcase
set hls

set listchars=tab:>-
set list


set scroll=10
set scrolloff=6
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
nnoremap _ j^
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
nnoremap t gt
nnoremap T gT

nnoremap <silent> * :<C-u>let @/="\\\<<C-r><C-w>\\\>" \| set hls<CR>

" Other remappable strokes in normal mode:
" +
" !
" #
" &
" -
" (
" )
" '
" S
" X
" U
nnoremap Q <Nop>
" K
" R
" C-g
" C-h
" C-j
" C-m
" C-n

let g:mapleader = "\<Space>"

augroup memorycursor
  autocmd!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

function! FindGitRoot()
    let command_result = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if strlen(command_result) > 0
        return command_result
    else
        return "."
    endif
endfunction

let s:nvim_config_dir = expand('~/.config/nvim')
let s:dein_dir = s:nvim_config_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:dein#auto_recache = 1

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml = s:nvim_config_dir . '/nvim-plugins.toml'
  let s:lazytoml = s:nvim_config_dir . '/nvim-plugins-lazy.toml'
  let s:ddu_toml = s:nvim_config_dir . '/ddu.toml'

  call dein#add('Shougo/dein.vim')

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazytoml, {'lazy': 1})
  call dein#load_toml(s:ddu_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set background=dark

set fillchars=vert:\|


augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" for alternate-lite
command! VS :normal :<C-u>AV<CR><C-w>L
