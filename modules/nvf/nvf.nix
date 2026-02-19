{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp.enable = true;
        treesitter.enable = true;
        telescope.enable = true;
        statusline.lualine.enable = true;
      };
    };
  };
}
