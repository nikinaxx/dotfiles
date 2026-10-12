# -----------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------

# -----------------------------------------------------
# Finder (ml4w fuzzy finder: cd into a dir or edit a file)
# -----------------------------------------------------
finder() {
    local result=$($HOME/.config/ml4w/bin/ml4w-finder)

    if [[ "$result" == TYPE_DIR:* ]]; then
        cd "${result#TYPE_DIR:}" && ls
    elif [[ "$result" == TYPE_FILE:* ]]; then
        ${EDITOR:-nano} "${result#TYPE_FILE:}"
    else
        echo "Could not read $result" >&2
        return 1
    fi
}

# -----------------------------------------------------
# Yazi (cd into the last directory on quit)
# -----------------------------------------------------
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
