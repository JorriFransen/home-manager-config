{ pkgs }: {

  asyncrun.vim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "asyncrun.vim";
    version = "2.9.5";
    src = pkgs.fetchFromGitHub {
      owner = "skywind3000";
      repo = "${pname}";
      rev = "${version}";
      sha256 = "0m631x07z6c2n4qkn1s2qr3s2fpzfhkfy55jf39p9p1c157wvqnb";
    };
    meta.homepage = "https://github.com/${src.owner}/${src.repo}";
  };

  barbar.nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "barbar.nvim";
    version = "2021-10-05";
    src = pkgs.fetchFromGitHub {
      owner = "romgrk";
      repo = "${pname}";
      rev = "6e638309efcad2f308eb9c5eaccf6f62b794bbab";
      sha256 = "0kvhwn3gr5x5vf2cgjda22naf8cvgkc43zalvxvr99s9jcjyynki";
    };
    meta.homepage = "https://github.com/${src.owner}/${src.repo}";
  };

  vim-llvm = pkgs.vimUtils.buildVimPlugin rec {
    pname = "vim-llvm";
    version = "2021-05-01";
    src = pkgs.fetchFromGitHub {
      owner = "rhysd";
      repo = "${pname}";
      rev = "9498d0e7799ed453d6e27248925b333f7865b233";
      sha256 = "0smbrr4csdmcc2c1afpw44mrzmqx5mb6fkss2440wpjsqz1xmxmb";
    };
    meta.homepage = "https://github.com/${src.owner}/${src.repo}";
  };

}
