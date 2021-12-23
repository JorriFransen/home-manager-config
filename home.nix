{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jorri"; home.homeDirectory = "/home/jorri";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.overlays = [
    ( import ./neovim/overlay.nix )
  ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [

    btop
    tmux
    zsh

    subversionClient
    git
    fossil tk tcl

    gdb

    exa
    fzf
    ripgrep
    colordiff

    xclip

    pass
    nextcloud-client
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      background_opacity = 0.97;
      font = {
        size = 8.5;
        use_thin_strokes = true;
        style = "regular";
        normal.family = "FuraCode Nerd Font";
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

  programs.neovim = import ./neovim { inherit pkgs; };

}
