"--------------------
" 基本的な設定
"--------------------
set tabstop=4	"Tabのサイズ
set shiftwidth=4	"インデントの幅
" tab可視化
set list
set listchars=tab:>-

"ノーマルモードで日本語オフ
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
NeoBundle 'scrooloose/nerdtree'	"nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
NeoBundle 'tpope/vim-surround'	"surround.vim

"NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'tpope/vim-commentary'	"使えないかも

" NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'kana/vim-smartchr'

"clang_complete(設定は下の方で)
NeoBundle 'Rip-Rip/clang_complete'



"カラースキーマ
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

NeoBundle 'ujihisa/unite-colorscheme'
 
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
 
" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neocomplete#enable_at_startup = 1		"補完を自動起動
"NeoSnippetの設定おわり

autocmd BufNewFile *.c 0r ~/.vim/template/c.txt
autocmd BufNewFile *.cpp 0r ~/.vim/template/cpp.txt


" clang_completeの設定
let g:clang_complete_auto = 1
let g:clang_user_options = '-std=c++11'
let g:clang_use_library=1
let g:clang_debug=1
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
let g:clang_auto_select=1
let g:clang_complete_copen = 0
let g:clang_periodic_quickfix = 1

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
map g/ <Plug>(incsearch-stay)


"smartchr
    let lst = [   ['<',     "smartchr#loop(' < ', ' << ', '<')" ],
                \ ['>',     "smartchr#loop(' > ', ' >> ', '>')"],
                \ ['+',     "smartchr#loop(' + ', '++', '+')"],
                \ ['-',     "smartchr#loop(' - ', '--', '-')"],
                \ ['/',     "smartchr#loop(' / ', '//', '/')"],
                \ ['&',     "smartchr#loop(' & ', ' && ', '&')"],
                \ ['%',     "smartchr#loop(' % ', '%')"],
                \ ['*',     "smartchr#loop('*', ' * ', '**')"],
                \ ['<Bar>', "smartchr#loop(' | ', ' || ', '|')"],
                \ [',',     "smartchr#loop(', ', ',')"]]
                "\ ['*',     "smartchr#loop(' * ', '*')"],
 
    for i in lst
        call smartinput#map_to_trigger('i', i[0], i[0], i[0])
        call smartinput#define_rule({ 'char' : i[0], 'at' : '\%#',                                      'input' : '<C-R>=' . i[1] . '<CR>'})
        call smartinput#define_rule({'char' : i[0], 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : i[0]})
        call smartinput#define_rule({ 'char' : i[0], 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',  'input' : i[0] })
    endfor
 
    call smartinput#define_rule({'char' : '>', 'at' : ' < \%#', 'input' : '<BS><BS><BS><><Left>'})
 
    call smartinput#map_to_trigger('i', '=', '=', '=')
    call smartinput#define_rule({ 'char' : '=', 'at' : '\%#',                                       'input' : "<C-R>=smartchr#loop(' = ', ' == ', '=')<CR>"})
    call smartinput#define_rule({ 'char' : '=', 'at' : '[&+-/<>|] \%#',                             'input' : '<BS>= '})
    call smartinput#define_rule({ 'char' : '=', 'at' : '!\%#',                                      'input' : '= '})
    call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : '='})
    call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',   'input' : '='})
 
    call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
    call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '(\s*)\%#'   , 'input' : '<C-O>dF(<BS>'})
    call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '{\s*}\%#'   , 'input' : '<C-O>dF{<BS>'})
    call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '<\s*>\%#'   , 'input' : '<C-O>dF<<BS>'})
    call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '\[\s*\]\%#' , 'input' : '<C-O>dF[<BS>'})
 
    for op in ['<', '>', '+', '-', '/', '&', '%', '\*', '|']
        call smartinput#define_rule({ 'char' : '<BS>' , 'at' : ' ' . op . ' \%#' , 'input' : '<BS><BS><BS>'})
    endfor


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
