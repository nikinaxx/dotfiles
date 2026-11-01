{ ... }: {
  imports = [ ./packages.nix ./links.nix ];

  home.username = "nik";
  home.homeDirectory = "/home/nik";
  home.stateVersion = "26.05"; # set once, never bump

  targets.genericLinux.enable = true; # non-NixOS: XDG paths, desktop entries

  programs.home-manager.enable = true;
}
