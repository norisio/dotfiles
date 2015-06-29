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
 
"インクリメンタルサーチを行う
set incsearch
 
"行番号を表示する
set number

set cursorline " カーソルラインの強調表示を有効化
autocmd VimEnter,WinEnter * let w:m_sp = matchadd("SpecialKey", '\(\t\| \+$\)')

 
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
set matchtime=1
 
"新しい行を作った時に高度な自動インデントを行う
set smarttab
set smartindent
 
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" ノーマルモードEnterで改行を挿入
nmap <CR> i<CR><ESC>

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

syntax on


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

if has('gui_macvim')
	"clang_complete(設定は下の方で)
	NeoBundle 'Rip-Rip/clang_complete'
endif



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


if has('gui_macvim')
	" clang_completeの設定
	let g:clang_complete_auto = 1
	let g:clang_user_options = '-std=c++11'
	let g:clang_use_library=1
	let g:clang_debug=1
	let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
	let g:clang_auto_select=1
	let g:clang_complete_copen = 0
	let g:clang_periodic_quickfix = 1
endif

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
" map g/ <Plug>(incsearch-stay)


" s;; -> std:: などのショートカット
augroup cpp-namespace
    autocmd!
    autocmd FileType cpp inoremap <buffer><expr>; <SID>expand_namespace()
augroup END
function! s:expand_namespace()
    let s = getline('.')[0:col('.')-1]
    if s =~# '\<b;$'
        return "\<BS>oost::"
    elseif s =~# '\<s;$'
        return "\<BS>td::"
    elseif s =~# '\<d;$'
        return "\<BS>etail::"
    else
        return ';'
    endif
endfunction
"おわり
