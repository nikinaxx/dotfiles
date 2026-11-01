{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in {
  home.file = {
    ".zshrc".source  = link "zsh/.zshrc";
    ".zshenv".source = link "zsh/.zshenv";
    ".bashrc".source = link "bash/.bashrc";
  };

  xdg.configFile = {
    "kitty".source    = link "kitty/.config/kitty";
    "yazi".source     = link "yazi/.config/yazi";
    "zshrc".source    = link "zsh/.config/zshrc";
    "bashrc".source   = link "bash/.config/bashrc";
    "ohmyposh".source = link "ohmyposh/.config/ohmyposh";
  };
}
