{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "JorriFransen";
        repo = "st";
        rev = "f3f0dba60c6254825415c8921c355e2e56489633";
        hash = "sha256-Q/66KfT+8ZXebXjYXQiEPRRMmXQwZMRFXYrShPlLsxE=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
