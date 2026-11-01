# -----------------------------------------------------
# ENV (read by every zsh, keep it small and silent)
# -----------------------------------------------------
# PATH lives in ~/.config/zshrc/init.zsh: /etc/profile runs after this file
# on login shells and would reorder it.

# Home Manager session variables (XDG_DATA_DIRS etc.); first so the exports below win
[ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ] && . ~/.nix-profile/etc/profile.d/hm-session-vars.sh

export EDITOR=nvim
export VISUAL=nvim
export STM32_PRG_PATH=/home/nik/.local/opt/STM32CubeProgrammer/bin
export STM32CubeMX_PATH=/home/nik/.local/opt/STM32CubeMX
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
