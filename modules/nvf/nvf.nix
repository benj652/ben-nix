{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        theme = {
          enable = true;
          name = "nord";
          style = "dark";
        };

        lineNumberMode = "relNumber";
        viAlias = true;
        vimAlias = true;
        lsp.enable = true;
        treesitter.enable = true;

        telescope = {
          enable = true;

          setupOpts = {
            defaults = {
              file_ignore_patterns = [
                "node_modules/.*"
                ".git/*"
              ];

              mappings = {
                i = {
                  "<C-j>" = "move_selection_next";
                  "<C-k>" = "move_selection_previous";
                };
                n = {
                  "<C-j>" = "move_selection_next";
                  "<C-k>" = "move_selection_previous";
                };
              };
            };

            pickers = {
              find_files = {
                theme = "ivy";
                hidden = true;
              };
            };

          };
        };

        statusline.lualine.enable = true;

        autocomplete.nvim-cmp.enable = true;
        languages = {
          nix.enable = true;
          ts.enable = true;
          bash.enable = true;
          python.enable = true;
        };

        globals.mapleader = " ";

        keymaps = [
          # Find files
          {
            key = "<C-p>";
            mode = "n";
            silent = true;
            action = "<cmd>Telescope find_files<CR>";
          }
          # netrw
          {
            key = "<leader>e";
            mode = "n";
            silent = true;
            action = "<cmd>Ex<CR>";
          }

          # Copy to system clipboard
          {
            key = "<leader>y";
            mode = "v";
            silent = true;
            action = "+y";
          }

          # Paste from system clipboard
          {
            key = "<leader>p";
            mode = "n";
            silent = true;
            action = "+p";
          }


          # Move lines down (visual)
          {
            key = "J";
            mode = "v";
            silent = true;
            action = ":m '>+1<CR>gv=gv";
          }

          # Move lines up (visual)
          {
            key = "K";
            mode = "v";
            silent = true;
            action = ":m '<-2<CR>gv=gv";
          }

          # Ctrl+c to escape (normal, insert, visual)
          {
            key = "<C-c>";
            mode = [ "n" "i" "v" ];
            silent = true;
            action = "<Esc>";
          }
        ];
      };
    };
  };
}
