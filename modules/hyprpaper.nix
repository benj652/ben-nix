{ config, pkgs, ... }:

let
  wallpaperPath = "/wallpapers/blue/wallpaper.png";
in
{
  # Install the package
  home.packages = with pkgs; [
    hyprpaper
  ];

  # Write the config file
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper = ,${wallpaperPath}
    mode = fill
  '';
}
