{ ... }:

{
  programs.nvf = {
    enable = true;
    
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = true;
      vim.vimAlias = false;
      vim.lsp = {
        enable = true;
      };
    };
  };
}
