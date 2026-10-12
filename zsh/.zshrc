#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#

# -----------------------------------------------------
# Load modular configuration (order matters)
# -----------------------------------------------------
# init: PATH first. options: compinit before anything that adds completions.
# keys: defines zvm_after_init before zsh-vi-mode loads in plugins (last).
source ~/.config/zshrc/init.zsh
source ~/.config/zshrc/options.zsh
source ~/.config/zshrc/fzf.zsh
source ~/.config/zshrc/keys.zsh
source ~/.config/zshrc/prompt.zsh
source ~/.config/zshrc/aliases.zsh
source ~/.config/zshrc/functions.zsh
source ~/.config/zshrc/autostart.zsh
source ~/.config/zshrc/plugins.zsh
