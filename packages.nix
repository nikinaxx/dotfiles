{ pkgs, ... }: {
  home.packages = with pkgs; [
    # from nix profile
    duckdb glow ouch yazi

    # CLI tools (currently dnf)
    bat eza fd fzf ripgrep zoxide jq gum gh
    btop htop fastfetch figlet tty-clock
    tesseract mediainfo imagemagick ffmpeg
    inotify-tools wl-clipboard
    lua dfu-util

    # installed outside any package manager
    oh-my-posh        # ~/.local/bin
    bitwarden-cli     # /usr/local/bin/bw
  ];

  # replaces nix profile direnv + nix-direnv and generates ~/.config/direnv/direnvrc
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
