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
  home.file.".config/nvim".source = ./modules/nvim;

  #######################################
  # Programs
  #######################################

  programs.git = {
    enable = true;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      bruh = "bruh chungus";
      nrs = "sudo nixos-rebuild switch --flake ~/ben-nix#benj-pc";
    };

    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec Hyprland
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
  ];
}
