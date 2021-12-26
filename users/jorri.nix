{ config, pkgs, lib, ... }:
let
  isNixOS = builtins.pathExists /etc/NIXOS;
in
{

  home.stateVersion = "21.11";

  home.language.base = "en_US.UTF-8";

  home.username = "jorri";
  home.homeDirectory = "/home/jorri";
  home.sessionVariables = {
    EDITOR = "nvim";
  };


  imports = [
    ../modules/neovim
    ../modules/zsh.nix
  ]
  ++ lib.optionals isNixOS
  [
    ../modules/alacritty.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  home.packages = with pkgs; [

    btop
    tmux
    tree

    subversionClient
    git gh
    fossil tk tcl

    gdb

    bat
    ripgrep
    colordiff

    xclip

    pass

  ]
  ++ lib.optionals isNixOS
  [
    nextcloud-client
    passff-host
    (firefox.override { extraNativeMessagingHosts = [ passff-host ]; } )
  ];

  programs.git = {
    enable = true;
    userName = "Jorri Fransen";
    userEmail = "jorri@jorrifransen.nl";
    signing = {
      signByDefault = true;
      key = "0980CB294516B081";
    };
  };
}
