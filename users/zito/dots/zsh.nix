{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    initExtra = ''
      export EDITOR=nvim
      ###################################### ZSH COMPLETION ######################################
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu yes=long select

      ##################################### NIX REBUILD FUNCS #####################################
      drs() {
        darwin-rebuild switch --flake ~/nix-config#"$1"
      }

      ############################################ FZF ############################################
      fg="#CBE0F0"
      bg="#011628"
      bg_highlight="#143652"
      purple="#B388FF"
      blue="#06BCE4"
      cyan="#2CF9ED"
      export FZF_DEFAULT_OPTS="--color=fg:''${fg},bg:''${bg},hl:''${purple},fg+:''${fg},bg+:''${bg_highlight},hl+:''${purple},info:''${blue},prompt:''${cyan},pointer:''${cyan},marker:''${cyan},spinner:''${cyan},header:''${cyan}"
      export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
      _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
      }
      _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
      }
      show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :50 {}; fi"
      export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
      export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
      _fzf_comprun() {
        local command=$1
        shift
        case "$command" in
          cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
          export|unset) fzf --preview "eval 'echo \''${}'"         "$@" ;;
          ssh)          fzf --preview 'dig {}'                   "$@" ;;
          *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
        esac
      }

      ####################################### KEY BINDINGS #######################################
      bindkey '^[[Z' reverse-menu-complete
      bindkey '^n' history-search-backward
      bindkey '^p' history-search-forward
      WORDCHARS=''${WORDCHARS/\/}
      
      ##################################### BAT (BETTER CAT) #####################################
      alias cat='bat'
      export BAT_THEME=TokyoNight_Night

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

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    themes = {
      TokyoNight_Night = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
          hash = "sha256-1xZhQR1BhH2eqax0swlNtnPWIEUTxSOab6sQ3Fv9WQA=";
        };
        file = "/extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--color=always"
      "--icons=always"
      "--all"
      "--git"
      "--long"
      "--no-time"
      "--no-user"
      # "--no-permissions"
      "--no-filesize"
    ];
  };
}