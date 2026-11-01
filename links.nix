{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in {
  xdg.configFile = {
    "hypr".source     = link "hypr/.config/hypr";
    "kitty".source    = link "kitty/.config/kitty";
    "noctalia".source = link "noctalia/.config/noctalia";
    "yazi".source     = link "yazi/.config/yazi";
  };
}
