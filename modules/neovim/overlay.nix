(self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "0.6.1";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "v$version}";
      sha256 = "1kzk3pjzayfi7vl8jahfkql6x3a6yivr9g007qw0pc607245jmcr";
    };
  });
})
