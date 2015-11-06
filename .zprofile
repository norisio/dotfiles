
# Setting PATH for JRuby 1.6.8
# The orginal version is saved in .bash_profile.jrubysave
if [ -d /Library/Frameworks ] ;then
	PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
	export PATH
fi

export PATH=/usr/local/bin:$PATH

if [ -d $HOME/.nvm ] ; then
	source ~/.nvm/nvm.sh
fi

##rbenv
if [ -d $HOME/.rbenv ] ; then
	export PATH="$HOME/.rbenv/bin:$PATH" 
	eval "$(rbenv init - zsh)"
fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH=$PATH:~/bin

if [ -d /usr/local/Cellar/qt5 ] ; then
	export PATH="/usr/local/Cellar/qt5/5.5.1/bin:$PATH"
fi
