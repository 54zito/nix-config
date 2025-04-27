{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.2;
        blur = true;
        # decorations = "Buttonless";
        option_as_alt = "Both";
      };
      font = {
        normal.family = "ComicCodeLigatures Nerd Font";
        size = 18;
      };
    };
  };
}