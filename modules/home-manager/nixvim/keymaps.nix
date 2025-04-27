{ ... }:

{
  globals.mapleader = " ";

  keymaps = [
    {
      mode = "i";
      key = "jk";
      action = "<ESC>";
      options = {
        desc = "Exit insert mode.";
      };
    }
    {
      mode = "n";
      key = "<leader>+";
      action = "<C-a>";
      options = {
        desc = "Increment number.";
      };
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-x>";
      options = {
        desc = "Decrement number.";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<C-w>s";
      options = {
        desc = "Split window horizontally.";
      };
    }
    {
      mode = "n";
      key = "<leader>sv";
      action = "<C-w>v";
      options = {
        desc = "Split window vertically.";
      };
    }
    {
      mode = "n";
      key = "<leader>se";
      action = "<C-w>=";
      options = {
        desc = "Make panes equal size.";
      };
    }
    {
      mode = "n";
      key = "<leader>sx";
      action = "<cmd>close<CR>";
      options = {
        desc = "Close current pane.";
      };
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>tabnew<CR>";
      options = {
        desc = "Create new tab.";
      };
    }
    {
      mode = "n";
      key = "<leader>tx";
      action = "<cmd>tabclose<CR>";
      options = {
        desc = "Close current tab.";
      };
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabn<CR>";
      options = {
        desc = "Next tab.";
      };
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<cmd>tabp<CR>";
      options = {
        desc = "Previous tab.";
      };
    }
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>tabnew %<CR>";
      options = {
        desc = "Open buffer in new tab.";
      };
    }
  ];
}
