{ config, pkgs, lib, ... }: {
  programs.neovim =
    let inherit (lib.vimUtils ./.) readLuaSection;
    in
    {
      # LSP config
      extraPackages = with pkgs; [ terraform-ls ];
      extraConfig = ''
        ${readLuaSection "lsp"}
      '';
    };
}
