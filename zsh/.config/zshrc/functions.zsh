# -----------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------

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

# -----------------------------------------------------
# Bitwarden picker (rbw)
# -----------------------------------------------------
# Enter copies the password, Ctrl+U the username, Ctrl+O the TOTP code.
# The clipboard is cleared after 30s if it still holds the copied value.
bwp() {
    rbw unlock || return  # ask for the password here, not inside the pipe
    local out key id value
    out=$(rbw list --fields id,name,user,folder \
        | fzf --delimiter='\t' --with-nth=2.. --query="$*" \
              --expect=ctrl-u,ctrl-o \
              --header='enter: password  ctrl-u: username  ctrl-o: totp') || return
    key=${out%%$'\n'*}
    id=${${out#*$'\n'}%%$'\t'*}
    case $key in
        ctrl-u) value=$(rbw get --field username "$id") ;;
        ctrl-o) value=$(rbw code "$id") ;;
        *)      value=$(rbw get "$id") ;;
    esac || return
    print -rn -- "$value" | wl-copy
    print "Copied, clearing in 30s"
    ( sleep 30; [[ $(wl-paste -n 2>/dev/null) == "$value" ]] && wl-copy --clear ) &!
}