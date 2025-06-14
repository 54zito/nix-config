{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    initContent = ''
      ###################################### ZSH COMPLETION ######################################
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu yes=long select

      ####################################### KEY BINDINGS #######################################
      bindkey '^[[Z' reverse-menu-complete
      bindkey '^n' history-search-backward
      bindkey '^p' history-search-forward
      WORDCHARS=''${WORDCHARS/\/}
      
      ########################################## HISTORY ##########################################
      SAVEHIST=$HISTSIZE
      HISTFILE=~/.zsh_history
      HISTDUP=erase
      HISTSIZE=5400
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