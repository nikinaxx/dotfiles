# -----------------------------------------------------
# FZF (key bindings are loaded in keys.zsh)
# -----------------------------------------------------

# strip-cwd-prefix removes the leading ./ from results
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

_FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# File picker excluding hidden files (bound to Ctrl+F)
_fzf_file_no_hidden() {
    local cmd result
    cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
    result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
        && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
    zle reset-prompt
}
zle -N _fzf_file_no_hidden
