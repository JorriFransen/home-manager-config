let
  my_version = "0.6.1";
in
(self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = my_version;
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "v${my_version}";
      hash = "sha256-0XCW047WopPr3pRTy9rF3Ff6MvNRHT4FletzOERD41A=";
    };
  });
})
