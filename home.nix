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
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 10;
      };

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, d, exec, wofi --show drun"
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"
      ];
    };
  };

}
