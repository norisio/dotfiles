if has('gui_macvim')
	set guifont=Ricty\ Diminished\ Regular:h17
	set transparency=10	"透明度

	colorscheme mydesert
	if has('multi_byte_ime')
		highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
		highlight CursorIM guifg=NONE guibg=#ecbcbc
	endif
	set columns=130
	set lines=40

	" GUI版でのtab等の文字色指定
	highlight SpecialKey guifg=black    
endif


set showtabline=2	"常にタブを表示
"set cmdheight=3
""タブ切り替え
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

"
