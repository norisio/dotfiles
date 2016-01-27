"問題点: 
"visualモードの選択範囲がわかりづらくなった
"vim-quickrunとかeasymotionのwindow越しとか動かない
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>-

set background=dark
set t_Co=256
highlight SpecialKey ctermfg=black
augroup SpecialKey
  autocmd!
  autocmd VimEnter,WinEnter * let w:m_sp = matchadd("SpecialKey", '\(\t\| \+$\)')
augroup END

" ビープ音なし
set visualbell t_vb=

set autoindent

set smarttab
set smartindent

set whichwrap=b,s,<,>,[,]
set backspace=start,eol,indent

set backupdir=$HOME/vimbackup
set undodir=$HOME/vimbackup
set directory=$HOME/vimbackup

set hidden
set autoread

set incsearch
set ignorecase
set smartcase
set nohlsearch

set number


"閉括弧が入力された時、対応する括弧を強調する
set showmatch
set matchtime=1
let loaded_matchparen = 1

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <silent><ESC><ESC> :nohlsearch<CR>

nnoremap Y y$

set pumheight=10

nnoremap + <C-a>
nnoremap - <C-x>

syntax enable

" コマンドラインモードで%%でパス展開
cnoremap <expr> %% getcmdtype() == ':'? expand('%:h').'/' : '%%'

set laststatus=2

nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
set scroll=10
set scrolloff=6
nnoremap j gj
nnoremap k gk
nnoremap _ j^

inoremap <C-j> <C-[>
vnoremap <C-j> <C-[>

set wildmenu

command! Vs  e $MYVIMRC
command! Gvs  e ~/.gvimrc
command! Zs  e ~/.zshrc
command! Zp  e ~/.zprofile

set ttimeoutlen=100

inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'easymotion/vim-easymotion'
"NeoBundle 'simeji/winresizer' "<C-e> hjkl <CR>
NeoBundle 'itchyny/lightline.vim'

"Texobject
NeoBundle 'tpope/vim-surround' "(v) S' (n)ys{op}' ds' cs')

"uniteのもの
NeoBundle 'ujihisa/unite-colorscheme'

"C++
if executable("clang")
	"NeoBundle 'justmao945/vim-clang'
  NeoBundle 'osyo-manga/vim-marching'
endif


"NeoBundle 'w0ng/vim-hybrid'


call neobundle#end()

colorscheme desert

" Required:
filetype plugin indent on

NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"NeoComplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#keyword_patterns._ = '\h\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

augroup SetOmniFunc
  autocmd!
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

"候補表示中Enterで確定, Escで補完中止 モードはそのまま
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "\<CR>" )
"endfunction
"inoremap <expr> <ESC> <SID>my_esc_function()
"function! s:my_esc_function()
"  return (pumvisible() ? "\<C-e>" : "\<ESC>" )
"endfunction
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" }}}

"NeoSnippetの設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" For snippet_complete marker.<-見えたほうがいい
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

"vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++ --pedantic-errors'
let g:clang_auto = 0
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
let g:clang_diagsopt = ''

"marching.vim
let g:marching_enable_neocomplete = 1
let g:marching#clang_command#options = {
      \"cpp" : "--std=c++11"
      \}
let g:marching_debug = 1

"quickrun
nmap <Leader>r <Plug>(quickrun)
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
  let g:quickrun_config = {
      \ "*": {"runner": "remote/vimproc"},
      \ }
endfunction

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
nnoremap z/ /
" map g/ <Plug>(incsearch-stay)

"lightlineの設定
set noshowmode
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \    },
      \ 'active':{
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ,
      \           [ 'absolutepath' ] ],
      \  },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ 'tabline':{'right' : [ [ ] ] }
      \ }

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'],
      \['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'],
      \['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'],
      \['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'],
      \ ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ],
      \[ 'mediumcyan', 'darkblue' ],
      \[ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'],
      \['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'],
      \['white', 'gray4'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'white', 'darkblue' ] ]
let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let g:lightline#colorscheme#default#palette
      \= lightline#colorscheme#fill(s:p)

"言語ごとの設定
""C++
augroup CppIndent
  autocmd!
  autocmd FileType c,cpp call s:cF()
augroup END
function! s:cF()
	setlocal cindent
	setlocal cinkeys +=;
endfunction
"autocmd FileType c          setlocal sw=4 sts=4 ts=4 et

""python
augroup PythonIndent
  autocmd!
  autocmd FileType python setlocal et ts=8 sw=2 sts=2 
        \cinwords=if,elif,else,for,while,try,except,finally,def,class
augroup END

"lilypond用
if has('mac')
	filetype off
  set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
	filetype on
endif

"easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1

""vim-operator-flashy
"map y <Plug>(operator-flashy)
"nmap Y <Plug>(operator-flashy)$


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
