{ pkgs, ... }: {
  imports = [
    ../common.nix
    ./core.nix
    ./brew.nix
    ./gpg.nix
    ./preferences.nix
    ./display-manager.nix
  ];
}
