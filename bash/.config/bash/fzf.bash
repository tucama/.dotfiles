# Setup.config/fzf
# ---------
if [[ ! "$PATH" == *$HOME/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
# source "$HOME/.config/bash/fzf-keymap.bash"
eval "$(fzf --bash)"
