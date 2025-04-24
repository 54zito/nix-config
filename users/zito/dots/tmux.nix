{ pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    prefix = "C-Space";
    extraConfig = ''
      set-option -g default-command "/bin/zsh"
      
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}