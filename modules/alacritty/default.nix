{ config, pkgs, lib, ... }:
{

  programs.alacritty = {
    enable = true;
    settings = {
      background_opacity = 0.97;
      font = {
        size = 8.5;
        use_thin_strokes = true;
        style = "bold";
        normal.family = "FuraCode Nerd Font";
        regular.family = "FuraCode Nerd Font";
        bold.family = "FuraCode Nerd Font";
        italic.family = "FuraCode Nerd Font";
      };
      # Colors (Gruvbox Material Dark Medium)
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xbfbf8e";
        };
        normal = {
          black =   "0x665c54";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xe78a4e";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xdfbf8e";
        };
        bright = {
          black =   "0x928374";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xe3a84e";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xdfbf8e";
        };
      };
    };
  };
}
