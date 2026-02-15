{ config, pkgs, ... }:

let
  wallpaperPath = "/home/benj/ben-nix/wallpapers/blue/wallpaper.png";
in
{
  # Install the package
  home.packages = with pkgs; [
    hyprpaper
  ];

  # Write the config file
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper {
      monitor = HDMI A-1
      path = ${wallpaperPath}
      fit_mode = fill
    }
  '';
}
