export LANG=ja_JP.UTF-8

# Zsh ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history

########################################
# Zsh 補完

# 補完機能を有効にする
autoload -Uz compinit
compinit

########################################
# Zsh オプション

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
setopt pushd_ignore_dups

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# プロンプトにWorking directory名
autoload colors
colors
PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "
PROMPT2='[%n]> ' 


# 空欄Enterでls
function my_enter {
if [[ -n "$BUFFER" ]]; then
	builtin zle .accept-line
	return 0
fi
#if [ "$WIDGET" != "$LASTWIDGET" ]; then
#	MY_ENTER_COUNT=0
#fi
case $[MY_ENTER_COUNT] in
	0)
		BUFFER=" ls"
		MY_ENTER_COUNT=1
		;;
	1)
		BUFFER=" ls -a"
		#if [[ -d .svn ]]; then
		#	BUFFER=" svn status"
		#elif git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		#	BUFFER=" git status -sb"
		#fi
		#unset MY_ENTER_COUNT
		MY_ENTER_COUNT=0
		;;
	*)
		unset MY_ENTER_COUNT
		;;
esac
#BUFFER=" ls"
builtin zle .accept-line
}
zle -N my_enter
bindkey '^m' my_enter

# ^でcd ..する
# # http://shakenbu.org/yanagi/d/?date=20120301
cdup() {
	if [ -z "$BUFFER" ]; then
		echo
		cd ..
		call_precmd
		zle reset-prompt
	else
		zle self-insert '^'
	fi
}
zle -N cdup
bindkey '\^' cdup


#個別のアプリケーションの初期化



#alias
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias tree='tree -N'
alias -g G='| grep'
alias winecmd='wine ~/.wine/drive_c/windows/system32/cmd.exe'
alias vs='vim ~/.vimrc'
alias gvs='vim ~/.gvimrc'
alias zs='vim ~/.zshrc'
alias zp='vim ~/.zprofile'
alias vi='vim'
alias sshs='ssh seimitsu2@pepc2.local -p60022'
alias getown='sudo chown -R $(whoami):admin /usr/local'
alias :q='exit'
