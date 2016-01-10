"--------------------
" 基本的な設定
"--------------------
set nocompatible
set tabstop=2  "Tabのサイズ
set shiftwidth=2  "インデントの幅
set expandtab
" tab可視化
set list
set listchars=tab:>-

"ノーマルモードで日本語オフ(Gui_MacVim_Kaoriya限定)
set imdisable
" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

" ビープ音なし
set visualbell t_vb=

"新しい行のインデントを現在行と同じにする
set autoindent

"新しい行を作った時に高度な自動インデントを行う
set smarttab
set smartindent

set whichwrap=b,s,<,>,[,]
set backspace=start,eol,indent

set backupdir=$HOME/vimbackup
set undodir=$HOME/vimbackup
set directory=$HOME/vimbackup

set hidden

"検索関係
set incsearch
set ignorecase
set smartcase
set nohlsearch

set number
"set cursorline " カーソルラインの強調表示を有効化
autocmd VimEnter,WinEnter * let w:m_sp = matchadd("SpecialKey", '\(\t\| \+$\)')


"閉括弧が入力された時、対応する括弧を強調する
set showmatch
set matchtime=1
let loaded_matchparen = 1

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" Y で行末までヤンクに変更
nnoremap Y y$

" 補完リストの高さを制限
set pumheight=10

nnoremap + <C-a>
nnoremap - <C-x>

syntax on

" コマンドラインモードで%%でパス展開
cnoremap <expr> %% getcmdtype() == ':'? expand('%:h').'/' : '%%'


"色関係
colorscheme desert

set t_Co=256
highlight SpecialKey ctermfg=black

set laststatus=2

" 上下スクロール
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
set scroll=10

nnoremap j gj
nnoremap k gk

set noshowmode

inoremap <C-j> <C-[>
vnoremap <C-j> <C-[>

set wildmenu

command! Vs  e ~/.vimrc
command! Gvs  e ~/.gvimrc
command! Zs  e ~/.zshrc
command! Zp  e ~/.zprofile

set ttimeoutlen=100

"<Space>関係

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-surround'

"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'vim-jp/cpp-vim'

NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'simeji/winresizer'
NeoBundle 'itchyny/lightline.vim'

"uniteのもの
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'kmnk/vim-unite-giti'

"if has('gui_macvim')
	NeoBundle 'justmao945/vim-clang'
"endif


call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"NeoSnippetの設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neocomplete#enable_at_startup = 1		"補完を自動起動
"NeoSnippetの設定おわり


let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++ --pedantic-errors'

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
nnoremap z/ /
" map g/ <Plug>(incsearch-stay)

"lightlineの設定
let g:lightline = {
  \ 'colorscheme' : 'modified',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \    },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

autocmd FileType c,cpp call s:cF()
function! s:cF()
	setlocal cindent
	setlocal cinkeys +=;
endfunction
"autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
"autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
"autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
"autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
"autocmd FileType java       setlocal sw=2 sts=2 ts=2 et
"autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
"autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
"autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
"autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
"autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
"autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
"autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
"autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
"autocmd FileType xml        setlocal sw=2 sts=2 ts=2 et
"autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et


"lilypond用
if has('mac')
	filetype off
  set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
  set nocursorline
	filetype on
endif

"easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1
