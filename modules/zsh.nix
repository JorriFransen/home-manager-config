{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    exa
    fzf
    fd
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "chisui/zsh-nix-shell"; }
      ];
    };

    shellAliases = {
      ls = "exa --group-directories-first ";
      nc = "sudo systemctl start nordvpnd && nordvpn connect";
      nd = "nordvpn disconnect && sudo systemctl stop nordvpnd";
      sctl = "systemctl";
      ssctl = "sudo systemctl ";
    };

    sessionVariables = {
      KEYTIMEOUT = 1;
      FZF_DEFAULT_COMMAND = "fd .";
      FZF_CTRL_T_COMMAND = "fd . /";
      FZF_ALT_C_COMMAND = "fd -t d . $HOME";

      PATH = "$PATH:/home/jorri/.scripts";
    };

    completionInit = ''
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)
    '';

    initExtra = ''
      bindkey -v
      setopt extendedglob nomatch

      # Use vim keys in tab complete menu:
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      source "$(fzf-share)"/key-bindings.zsh
      source "$(fzf-share)"/completion.zsh

      man () {
          text=$(command man "$@") && echo "$text" | col -b | vim -R +":set ft=man nomod nonu noma nolist colorcolumn=" - ;
      }

      gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
      export GPG_TTY=$(tty)

      source ~/.p10k.zsh

      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels''${NIX_PATH:+:$NIX_PATH}

    '';
  };

}
