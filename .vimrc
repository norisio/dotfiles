set nocompatible
set encoding=utf-8
set fileencodings=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

set visualbell t_vb=
set autoindent

set smarttab
set smartindent

set wildmenu

set whichwrap=b,s,<,>,[,]
set backspace=start,eol,indent

set backupdir=$HOME/vimbackup
set undodir=$HOME/vimbackup
set directory=$HOME/vimbackup//

set hidden
set autoread

set incsearch
set ignorecase
set smartcase
set nohlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohls!<CR>
nnoremap Y y$

set pumheight=10

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
set scroll=10
set scrolloff=6
nnoremap j gj
nnoremap k gk
nnoremap _ j^
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$



"lilypond用
if has('mac')
  filetype off
  set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
  filetype on
  "augroup lilypondmac
	  "autocmd FileType lilypond let g:neocomplete#sources#dictionary#dictionaries = { 'lilypond' : $HOME . '/repository/ly_dic/dic.txt' }
  "augroup END
endif


let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('fatih/vim-go')
  call dein#end()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
