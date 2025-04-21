{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      ls="ls --color";
      l="ls -la";
      lr="ls -lR";
      c="clear";
      drs="darwin-rebuild switch --flake ~/nix-config#arya";
      grep="grep --color";
    };
    initExtra = ''
      # COMPLETION OPTIONS
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # KEY BINDINGS
      bindkey '^n' history-search-backward
      bindkey '^p' history-search-forward

      # HISTORY
      HISTFILE=~/.zsh_history
      HISTSIZE=5400
      SAVEHIST=$HISTSIZE
      HISTDUP=erase
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_dups
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_find_no_dups

      # INTEGRATIONS
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}