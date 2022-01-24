{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "JorriFransen";
        repo = "st";
        rev = "be59b1fd68f3e6c211814ed4823ac6f94669d132";
        hash = "sha256-v6HM3Rz0nUSON0/ksnJo1K+twqzmJiQk4SUyBCZBLM8=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
