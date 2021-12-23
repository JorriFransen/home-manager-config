{ pkgs }:
let
  vim-plugins = import ./plugins.nix { inherit pkgs; };
in
{
  enable = true;
  vimAlias = true;
  viAlias = true;
  extraConfig = builtins.readFile ./init.vim;
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

    nvim-lspconfig
    #nvim-cmp
    #cmp-nvim-lsp
    #vim-vsnip
    coc-nvim
    coc-clangd

    nvim-treesitter

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
  ];
}
