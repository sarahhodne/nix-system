{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "1password"
      "docker"
      "istat-menus"
      "little-snitch"
      "kitty"
      "meetingbar"
      "micro-snitch"
      "slack"
      "spotify"
      "visual-studio-code"
      "zoom"
    ];
  };
}
