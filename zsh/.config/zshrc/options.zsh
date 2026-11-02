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
zle_highlight=('paste:none')  # don't highlight pasted text (looks like a selection)

# -----------------------------------------------------
# Completion
# -----------------------------------------------------
zmodload zsh/complist
# Completions shipped by Nix packages (rg, fd, bat, eza, gh, ...); must come before compinit
fpath=(~/.nix-profile/share/zsh/site-functions $fpath)
autoload -Uz compinit
mkdir -p ${XDG_CACHE_HOME:-~/.cache}/zsh
compinit -d ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompdump
# fzf-tab replaces the built-in menu (see plugins.zsh)
zstyle ':completion:*' menu no
# Group headers (plain text: fzf-tab drops colour escapes); < and > switch group
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group '<' '>'
# Keep the popup tall enough for previews even with few matches
zstyle ':fzf-tab:*' fzf-min-height 20
# Preview the highlighted directory when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=always $realpath'
# Preview file contents (or a listing for directories) for commands that open files
zstyle ':fzf-tab:complete:(nvim|bat|less):*' fzf-preview \
    '[[ -d $realpath ]] && eza -1 --color=always --icons=always $realpath \
     || bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase matches both cases
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
