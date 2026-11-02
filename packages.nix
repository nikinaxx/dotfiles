{ pkgs, ... }: {
  home.packages = with pkgs; [
    duckdb glow ouch yazi
    bat eza fd fzf ripgrep zoxide jq gum gh
    btop htop fastfetch figlet tty-clock
    tesseract mediainfo imagemagick ffmpeg
    inotify-tools wl-clipboard
    lua dfu-util
    oh-my-posh       
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
