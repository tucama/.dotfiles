# Setup.config/fzf
# ---------
if [[ ! "$PATH" == */home/tucamar/.config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tucamar/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tucamar/.config/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tucamar/.config/fzf/shell/key-bindings.bash"
