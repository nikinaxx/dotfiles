# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

# -----------------------------------------------------
# Listing (eza)
# -----------------------------------------------------
alias ls='eza --icons=auto'
alias ll='eza -lh --icons=auto --git'
alias la='eza -lah --icons=auto --git'
alias tree='eza --tree --icons=auto'

# -----------------------------------------------------
# Core utilities
# -----------------------------------------------------
alias cat='bat'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# -----------------------------------------------------
# General
# -----------------------------------------------------
alias ..='cd ..'
alias -- -='cd -'  # -- stops - being read as a flag
alias c='clear'
alias ff='fastfetch'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias clock='tty-clock'

# -----------------------------------------------------
# System
# -----------------------------------------------------
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
