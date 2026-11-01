{ ... }: {
  imports = [ ./packages.nix ./links.nix ./git.nix ./ssh.nix ./tmux.nix ];

  home.username = "nik";
  home.homeDirectory = "/home/nik";
  home.stateVersion = "26.05"; # set once, never bump

  targets.genericLinux.enable = true; # non-NixOS: XDG paths, desktop entries
  targets.genericLinux.gpu.enable = false; # GUI apps come from dnf, Nix needs no GPU access

  programs.home-manager.enable = true;
}
