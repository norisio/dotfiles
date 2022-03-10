
#tmux
PERCOL=$HOME/.local/share/zinit/plugins/junegunn---fzf-bin/fzf
TMUX_BIN=tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`$TMUX_BIN list-sessions`"
  if [[ -z "$ID" ]]; then
    $TMUX_BIN new-session
  else
    create_new_session="Create New Session"
    ID="$ID\n${create_new_session}:"
    ID="`echo $ID | $PERCOL | cut -d: -f1`"
    if [[ "$ID" = "${create_new_session}" ]]; then
      $TMUX_BIN new-session
    elif [[ -n "$ID" ]]; then
      $TMUX_BIN attach-session -t "$ID"
    else
      :  # Start terminal normally
    fi
  fi
fi

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
fi

if [[ -f $HOME/.zprofile.local ]]; then
  source $HOME/.zprofile.local
fi
