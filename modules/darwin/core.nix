{ inputs, config, pkgs, ... }:
let prefix = "/run/current-system/sw/bin";
in
{
  # environment setup
  environment = {
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    backupFileExtension = "backup";
    etc = { darwin.source = "${inputs.darwin}"; };
  };

  fonts.enableFontDir = true;
  nix.nixPath = [ "darwin=/etc/${config.environment.etc.darwin.target}" ];

  # auto manage nixbld users with nix darwin
  users.nix.configureBuildUsers = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
