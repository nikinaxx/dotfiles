#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# Fallback shell. zsh is the login shell; this mirrors its basics.

# -----------------------------------------------------
# System defaults (Fedora)
# -----------------------------------------------------
[ -f /etc/bashrc ] && . /etc/bashrc

# Home Manager session variables
[ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ] && . ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# -----------------------------------------------------
# Environment
# -----------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
export STM32_PRG_PATH="$HOME/.local/opt/STM32CubeProgrammer/bin"
export STM32CubeMX_PATH="$HOME/.local/opt/STM32CubeMX"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Append once, so nested shells don't keep growing PATH
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin" ;;
esac
export PATH

# Everything below is for interactive shells only
[[ $- != *i* ]] && return

# -----------------------------------------------------
# Aliases
# -----------------------------------------------------
alias ls='eza --icons=auto'
alias ll='eza -lh --icons=auto --git'
alias la='eza -lah --icons=auto --git'
alias tree='eza --tree --icons=auto'

alias cat='bat'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

alias ..='cd ..'
alias c='clear'
alias ff='fastfetch'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias clock='tty-clock'

alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# -----------------------------------------------------
# Yazi (cd into the last directory on quit)
# -----------------------------------------------------
y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# -----------------------------------------------------
# Tools (zoxide last, it wants to be initialized at the end)
# -----------------------------------------------------
eval "$(direnv hook bash)"
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config "$HOME/.config/ohmyposh/catppuccin_mocha.omp.json")"
eval "$(zoxide init bash --cmd cd)"
