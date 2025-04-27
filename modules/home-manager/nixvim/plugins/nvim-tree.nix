{ ... }:

{
  plugins = {
    web-devicons.enable = true;

    nvim-tree = {
      enable = true;
    };
  };

  keymaps = [
     {
      mode = "n";
      key = "<leader>ee";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "Open file explorer.";
      };
    }
    {
      mode = "n";
      key = "<leader>ec";
      action = "<cmd>NvimTreeCollapse<CR>";
      options = {
        desc = "Collapse all files in explorer.";
      };
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options = {
        desc = "Open file explorer on current file.";
      };
    }
    {
      mode = "n";
      key = "<leader>er";
      action = "<cmd>NvimTreeRefresh<CR>";
      options = {
        desc = "Reaload file explorer.";
      };
    }
  ];
}