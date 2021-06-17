{ config, pkgs, ... }: {
  xdg.enable = true;
  xdg.configFile = {
    "nixpkgs/config.nix".source = ../../config.nix;
    skhd = {
      source = ./skhd;
      recursive = true;
    };

    yabai = {
      source = ./yabai;
      recursive = true;
    };
  };
}
