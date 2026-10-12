# -----------------------------------------------------
# KEYS (vi mode via zsh-vi-mode, see plugins.zsh)
# -----------------------------------------------------

# -----------------------------------------------------
# Widgets
# -----------------------------------------------------
# Toggle sudo in front of the line (or the last command)
_sudo_toggle() {
    if [[ -z $BUFFER ]]; then
        BUFFER=$(fc -ln -1)
        CURSOR=$#BUFFER
    fi
    if [[ $BUFFER == "sudo "* ]]; then
        BUFFER=${BUFFER#sudo }
        (( CURSOR = CURSOR > 5 ? CURSOR - 5 : 0 ))
    else
        BUFFER="sudo $BUFFER"
        (( CURSOR += 5 ))
    fi
}
zle -N _sudo_toggle

# Copy the current line to the clipboard
_copy_buffer() {
    print -rn -- $BUFFER | wl-copy
    zle -M "Copied to clipboard"
}
zle -N _copy_buffer

# -----------------------------------------------------
# Bindings
# -----------------------------------------------------
# zsh-vi-mode resets the keymaps when it starts, so bind
# everything in its hooks instead of at load time.

# Insert mode
zvm_after_init() {
    # Ctrl+R history, Ctrl+T files, Alt+C cd
    source <(fzf --zsh)

    bindkey '^[[H'    beginning-of-line
    bindkey '^[OH'    beginning-of-line
    bindkey '^[[F'    end-of-line
    bindkey '^[OF'    end-of-line
    bindkey '^[[3~'   delete-char
    bindkey '^[[1;5D' backward-word
    bindkey '^[[1;5C' forward-word
    bindkey '^H'      backward-kill-word

    bindkey '^[[A'    history-substring-search-up
    bindkey '^[OA'    history-substring-search-up
    bindkey '^[[B'    history-substring-search-down
    bindkey '^[OB'    history-substring-search-down

    bindkey '^F'      _fzf_file_no_hidden
    bindkey '^O'      _copy_buffer
    bindkey '^[s'     _sudo_toggle
}

# Normal mode
zvm_after_lazy_keybindings() {
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
}
