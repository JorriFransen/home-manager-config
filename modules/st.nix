{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "JorriFransen";
        repo = "st";
        rev = "0.8.5-j-0.1";
        hash = "sha256-68Ix8Dd04hsR+3A35BPzBTl6wzdjx9A2fBKbu4EDdpQ=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
