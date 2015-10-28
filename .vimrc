"--------------------
" 基本的な設定
"--------------------
set tabstop=4	"Tabのサイズ
set shiftwidth=4	"インデントの幅
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

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]


"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"クリップボードをWindowsと連携する
"set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"タブの代わりに空白文字を挿入する
"set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"検索関係
set incsearch
set ignorecase
set smartcase
"set hlsearch
set nohlsearch


"行番号を表示する
set number

set cursorline " カーソルラインの強調表示を有効化
autocmd VimEnter,WinEnter * let w:m_sp = matchadd("SpecialKey", '\(\t\| \+$\)')


"閉括弧が入力された時、対応する括弧を強調する
set showmatch
set matchtime=1

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

set hlsearch
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" ノーマルモードEnterで改行を挿入
"nmap <CR> i<CR><ESC>


" Y で行末までヤンクに変更
nnoremap Y y$

" 補完リストの高さを制限
set pumheight=10

" インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" smartinputを回避する括弧
inoremap \( (
inoremap \{ {
inoremap \) )
inoremap \} }

syntax on

" コマンドラインモードで%%でパス展開
cnoremap <expr> %% getcmdtype() == ':'? expand('%:h').'/' : '%%'


"色関係
colorscheme desert

highlight SpecialKey ctermfg=black
set t_Co=256



"2段ステータスバー
set laststatus=2

" 上下スクロール
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" モード抜けのマッピング
inoremap <C-j> <C-[>
vnoremap <C-j> <C-[>

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'mattn/emmet-vim'	"emmet
NeoBundle 'kana/vim-smartinput'	"vim-smartinput
"NeoBundle 'scrooloose/nerdtree'	"nerdtree
"nnoremap <silent><C-e> :NERDTreeToggle<CR>
"let NERDTreeShowHidden = 1
NeoBundle 'tpope/vim-surround'	"surround.vim

"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
"uniteのもの
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'vim-jp/cpp-vim'

" NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'kurocode25/mdforvim'

"if has('gui_macvim')
"	"clang_complete(設定は下の方で)
"	NeoBundle 'Rip-Rip/clang_complete'
"endif
"if has('gui_macvim')
	NeoBundle 'justmao945/vim-clang'
"endif



"カラースキーマ
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
" molokai
NeoBundle 'tomasr/molokai'
"lightline
NeoBundle 'itchyny/lightline.vim'


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


if has('gui_macvim')
	autocmd BufNewFile *.c 0r ~/.vim/template/c.txt
	autocmd BufNewFile *.cpp 0r ~/.vim/template/cpp.txt
endif


let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

"rainbow_parentheses設定
let g:rbpt_colorpairs = [
    \ ['brown',       'cyan'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrange3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'white'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'grey'],
    \ ['brown',       'blue'],
    \ ['gray',        'lightgreen'],
    \ ['black',       'lightred'],
    \ ['darkmagenta', 'yellow'],
    \ ['Darkblue',    'magenta'],
    \ ['darkgreen',   'lightblue'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrange3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"自動ON
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound			"()
au Syntax * RainbowParenthesesLoadSquare		"[]
au Syntax * RainbowParenthesesLoadBraces		"{}
"au Syntax * RainbowParenthesesLoadChevrons		"<>


" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
nnoremap z/ /
" map g/ <Plug>(incsearch-stay)

"lightlineの設定
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"autocmd FileType c,cpp inoremap <buffer>; ;<C-[>==a
autocmd FileType c,cpp call s:cF()
function! s:cF()
	setlocal cindent
	setlocal cinkeys +=;
endfunction

"lilypond用
if has('gui_macvim')
	filetype off
	set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
	filetype on
endif
