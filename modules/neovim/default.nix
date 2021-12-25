{ config, pkgs, lib, ... }:
let
  vim-plugins = import ./plugins.nix { inherit pkgs; };

  isNixOS = builtins.pathExists /etc/NIXOS;
in
{
  xdg.configFile = {
    "nvim/after".source = ./config/after;
    "nvim/compiler".source = ./config/compiler;
  };

  nixpkgs.overlays = [
    ( import ./overlay.nix )
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = builtins.readFile ./config/init.vim;
    extraPackages = with pkgs; [
      clang-tools # for clangd/coc/lsp
      fzf
      fd
      ripgrep
      nodejs # for coc
    ];
    plugins = with pkgs.vimPlugins; with vim-plugins; [
      asyncrun.vim
      barbar.nvim
      vim-llvm

      coc-nvim
      coc-clangd



      nvim-web-devicons
      delimitMate
      gruvbox-community
      vim-nix
      fzf-vim
      vim-airline
      vim-airline-themes
      nerdcommenter
      undotree
      vim-smoothie
    ]
    ++ lib.optionals isNixOS
    [
      nvim-treesitter
    ]
    ++ lib.optionals (!isNixOS)
    [
      (nvim-treesitter.withPlugins
        (plugins: with plugins; [
          tree-sitter-nix
          tree-sitter-cpp
          tree-sitter-lua
        ])
      )
    ];
  };
}
