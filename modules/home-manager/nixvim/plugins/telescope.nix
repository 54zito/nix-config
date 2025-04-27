{ ... }:

{
  plugins.telescope = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options = {
        desc = "Fuzzy find file in current working directory.";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<CR>";
      options = {
        desc = "Find string in current working directory.";
      };
    }
     {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope grep_string<CR>";
      options = {
        desc = "Find string under cursor.";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<CR>";
      options = {
        desc = "Fuzzy find recent files.";
      };
    }
  ];
}