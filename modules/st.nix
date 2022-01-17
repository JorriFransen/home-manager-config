{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "JorriFransen";
        repo = "st";
        rev = "3cc61ae4ed24da0a40d99165b2d74094cb0b9c51";
        hash = "sha256-Jtf83mRdCOKNXtcCo96b7+zZcVcO78QeACJAhnLiHUQ=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
