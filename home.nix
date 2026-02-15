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
  #######################################
  # Programs
  #######################################

  programs.git = {
    enable = true;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      bruh = "echo bruh chungus";
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
    waybar
    
    # Theme and icon packages
    adwaita-icon-theme
    gnome-themes-extra
    gtk3
    gtk4
    papirus-icon-theme
    libsForQt5.breeze-icons
  ];

  #######################################
  # GTK Theme Configuration
  #######################################
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };
  };

  # Qt theme configuration
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

}
