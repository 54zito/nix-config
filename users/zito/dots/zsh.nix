{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      ls="ls --color";
      l="ls -la";
      lr="ls -lR";
      c="clear";
      grep="grep --color";
    };
    initExtra = ''
      # COMPLETION OPTIONS
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu yes=long select

      # FUNCTION
      drs() {
        darwin-rebuild switch --flake ~/nix-config#"$1"
      }
      nrs() {
        nixos-rebuild switch --flake ~/nix-config#"$1"
      }

      # KEY BINDINGS
      bindkey '^[[Z' reverse-menu-complete
      bindkey '^n' history-search-backward
      bindkey '^p' history-search-forward

      # VARIABLE
      HISTFILE=~/.zsh_history
      HISTSIZE=5400
      SAVEHIST=$HISTSIZE
      HISTDUP=erase
      WORDCHARS=''${WORDCHARS/\/}

      # HISTORY
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_dups
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_find_no_dups
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
}