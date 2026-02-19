{ config, pkgs, ... }:

{
  #######################################
  # Basic User Info
  #######################################
  home.username = "benj";
  home.homeDirectory = "/home/benj";
  home.stateVersion = "25.11";

  #######################################
  # Import External Configs
  #######################################
  imports = [
     ./modules/hyprland.nix
     ./modules/hyprpaper.nix   
   ]; 
  home.file.".config/nvim".source = ./modules/nvim;
  xdg.configFile."waybar/config.jsonc".source = ./modules/waybar/config.jsonc;
  #######################################
  # Programs
  #######################################

  programs.git = {
     enable = true;
     settings = {
       user = {
         name  = "Ben Jaffe";
         email = "benjaminjaffe8@gmail.com";
       };
       init.defaultBranch = "main";
     };   
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      bruh = "echo bruh chungus";
      nrs = "sudo nixos-rebuild switch --flake ~/ben-nix#benj-pc";
      vim = "nvim";
    };

    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec start-hyprland
      fi
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  #######################################
  # Packages
  #######################################
  home.packages = with pkgs; [
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    wofi
    nitch
    pcmanfm

    # Java
    # jdk
    # jdt-language-server

    # Lua
    # lua-language-server

    # Bash
    # nodePackages.bash-language-server

    # Go
    # gopls

    # C/C++
    # clang-tools

    # Web
    # nodePackages.typescript-language-server
    # nodePackages.vscode-langservers-extracted
    # tailwindcss-language-server
    # texlab
  ];


}
