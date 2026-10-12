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
alias lock='hyprlock'
alias clock='tty-clock'

# -----------------------------------------------------
# ML4W
# -----------------------------------------------------
alias shutdown='~/.config/ml4w/scripts/ml4w-power -p'
alias apps='~/.config/ml4w/bin/ml4w-apps'
alias screenshot='~/.config/ml4w/bin/ml4w-screenshot'
alias updates='~/.config/ml4w/scripts/ml4w-install-system-updates'
alias system='~/.config/ml4w/settings/systemmonitor'
alias quick='~/.config/ml4w/bin/ml4w-quicklinks'
alias wallpaper='~/.config/ml4w/bin/ml4w-wallpaper'
alias settings='ml4w-dotfiles-settings com.ml4w.dotfiles'
alias ascii='~/.config/ml4w/scripts/ml4w-ascii-header'

# -----------------------------------------------------
# System
# -----------------------------------------------------
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
