{ config, lib, pkgs, ... }: {
  home.packages = [ ];
  programs.git = {
    package = pkgs.gitAndTools.gitFull;

    userName = "Sarah Hodne";
    signing = {
      key = "15AA147F88B4C1F578E353B8F625971C87F922D7";
      signByDefault = true;
    };

    aliases = {
      st = "status -sb";
    };

    extraConfig = {
      http.sslVerify = true;
      http.sslCAInfo = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
      commit.verbose = true;
      init.defaultBranch = "main";
      push.default = "tracking";
      url."git@github.com:circleci".insteadOf = "https://github.com/circleci";
      url."git@github.com:sarahhodne".insteadOf = "https://github.com/sarahhodne";
      color.ui = true;
      rebase = {
        autosquash = true;
        abbreviateCommands = true;
      };
    };
    delta.enable = true;
  };
}

