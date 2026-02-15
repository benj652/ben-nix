{ config, pkgs, ... }:

{
  programs.hyprland = {
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

