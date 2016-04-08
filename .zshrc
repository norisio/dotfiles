export LANG=ja_JP.UTF-8

# Zsh ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history

# zplug
if [ ! -f ~/.zplug/zplug ]; then
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
fi
source ~/.zplug/zplug
### plug-ins
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, of:"*${(L)$(uname -s)}*amd64*", file:fzf
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "mrowa44/emojify", as:command
### 
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

########################################
# Zsh 補完

# 補完機能を有効にする
autoload -Uz compinit
compinit -C

########################################
# Zsh オプション

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
setopt pushd_ignore_dups

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 訂正
setopt correct

#######################################
# Color
#######################################
# 色の設定
#export LSCOLORS=Exfxcxdxbxegedabagacad
export LSCOLORS=Exfxcxdxbxahadabagacad
#export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=0;47:cd=0;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# プロンプト
autoload colors
colors

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[⭠%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {vcs_info}

PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%} "
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT"
[%n]$ "
PROMPT2='[%n]> ' 
setopt transient_rprompt

RPROMPT=""

[[ -n "$VIMRUNTIME" ]] && \
  RPROMPT="%{${bg[green]}%}%{${fg[black]}%}  Running on Vim  %{${reset_color}%} $RPROMPT"


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
#alias winecmd='wine ~/.wine/drive_c/windows/system32/cmd.exe'
alias vs='vim ~/.vimrc'
alias gvs='vim ~/.gvimrc'
alias zs='vim ~/.zshrc'
alias zp='vim ~/.zprofile'
alias vi='vim'
alias :q='exit'
case "${OSTYPE}" in
  linux*)
    alias ls='ls -F --color=auto'
    alias a-upd='sudo apt-get update'
    alias a-upg='sudo apt-get upgrade'
    alias a-ins='sudo apt-get install '
    ;;
  darwin*)
    alias ls='ls -G -F'
    alias getown='sudo chown -R $(whoami):admin /usr/local'
    alias readlink='greadlink'
    alias awk='gawk'
    alias sed='gsed'
    alias date='gdate'
    ;;
esac
alias ga="git add ."
alias gc="git commit"
alias gs="git status"
alias gp="git push"
alias -g L="| less"
alias -g G='| grep'
alias -s py='python3 '

mkcd() {
  mkdir $1
  cd $1
  return 0
}

case "${OSTYPE}" in
  darwin*)
    fvim(){ mdfind $1|fzf -m |xargs -o vim -p }
    ;;
esac

#不明コマンドのサジェスチョン
if [ -f /etc/zsh_command_not_found ] ; then
  source /etc/zsh_command_not_found
fi

#時間計測を呼び出す
if (which zprof > /dev/null) ;then
  zprof | less
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo Welcome to `zsh --version` !