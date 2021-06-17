{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.iosevka-bin;
      name = "Iosevka";
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = (if pkgs.stdenvNoCC.isDarwin then 14 else 12);
      strip_trailing_spaces = "smart";
      enable_audio_bell = "no";
      term = "xterm-256color";
      macos_titlebar_color = "background";
      macos_option_as_alt = "yes";
      scrollback_lines = 10000;
    };
    extraConfig = ''
      background #5a5475
      foreground #f8f8f2
      cursor     #c7b7c7

      selection_background  #f3e0b8
      selection_foreground  #0e0c15

      color0                #3b3a32
      color8                #686868
      color1                #f1756f
      color9                #ff9f9a
      color2                #6de874
      color10               #7bfa81
      color3                #36c000
      color11               #ffea00
      color4                #a381ff
      color12               #c5a3ff
      color5                #ff87b1
      color13               #ffb8d1
      color6                #7ef5b8
      color14               #c2ffdf

      color7                #c7b7c7
      color15               #c7b7c7
    '';
  };
}
