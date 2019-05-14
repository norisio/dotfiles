set termguicolors
set fencs=utf-8
set ts=2 sts=2 sw=2 et

set laststatus=2
set autoindent
set smarttab
set smartindent

set wildmenu

set incsearch
set inccommand=split
set smartcase
set nohls

nnoremap Y y$

set scroll=10
set scrolloff=6
nnoremap j gj
nnoremap k gk
nnoremap _ j^
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

nnoremap <silent> * :<C-u>let @/="\\\<<C-r><C-w>\\\>" \| set hls<CR>

let s:dein_dir = expand('~/.config/nvim/dein')
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
  call dein#add('jonathanfilip/vim-lucius')
  call dein#add('airblade/vim-gitgutter')

  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1

  call dein#add('lighttiger2505/gtags.vim')
  
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('LucHermitte/lh-vim-lib')
  call dein#add('LucHermitte/alternate-lite')
  call dein#add('kana/vim-textobj-user')
  call dein#add('sgur/vim-textobj-parameter')


  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme lucius

set fillchars=vert:\|


augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
