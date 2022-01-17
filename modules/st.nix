{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "JorriFransen";
        repo = "st";
        rev = "6a0be17d4e6967fcabde56dbd96da872ba98154c";
        #hash = "sha256-do2cpdclphzDs3SaO5c6J/5Iu4wQXDfDNQ2o9naMf3u=";
        hash = "sha256-pzZ6znQO0g0RPmZLgWCSg/FgVZUu+Cj0WrXHqRgIw8o=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
