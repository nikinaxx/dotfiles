{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Shell & prompt
    oh-my-posh zoxide

    # CLI utilities
    bat eza fd fzf gum jq ripgrep

    # File management (yazi + its previewers/archive tool)
    yazi ouch mediainfo

    # Data & docs
    duckdb glow

    # Media & OCR
    ffmpeg imagemagick tesseract

    # System info & monitoring
    btop fastfetch htop

    # Development
    gh lua
    clang-tools      # clangd, clang-tidy, clang-format

    # Embedded
    dfu-util

    # Desktop / Wayland
    inotify-tools wl-clipboard

    # Fun
    figlet tty-clock
  ];

  # replaces nix profile direnv + nix-direnv and generates ~/.config/direnv/direnvrc
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Bitwarden CLI with a background agent that keeps the vault unlocked
  programs.rbw = {
    enable = true;
    settings = {
      email = "nik.vozelj@hotmail.com";
      base_url = "https://vault.nik-sys.com";
      lock_timeout = 3600;               # seconds before the agent locks again
      pinentry = pkgs.pinentry-gnome3;   # GNOME's own password prompt
    };
  };
}
