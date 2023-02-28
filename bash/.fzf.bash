# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tucamar/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tucamar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tucamar/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tucamar/.fzf/shell/key-bindings.bash"
