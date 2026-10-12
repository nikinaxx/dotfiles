# -----------------------------------------------------
# OPTIONS
# -----------------------------------------------------

# -----------------------------------------------------
# History
# -----------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history share_history extended_history
setopt hist_ignore_dups hist_ignore_space
setopt hist_expire_dups_first hist_find_no_dups

# -----------------------------------------------------
# General
# -----------------------------------------------------
setopt auto_cd interactive_comments no_beep
setopt numeric_glob_sort  # sort file10 after file9, not after file1

# -----------------------------------------------------
# Completion
# -----------------------------------------------------
zmodload zsh/complist
autoload -Uz compinit
mkdir -p ${XDG_CACHE_HOME:-~/.cache}/zsh
compinit -d ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase matches both cases
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
