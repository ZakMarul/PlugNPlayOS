{ pkgs, config, inputs, ... }:

{
  programs.noctalia = {
    enable = true;
    settings = {
      shell.font_family = "JetBrainsMono Nerd Font";
      theme = {
        source = "community";
        community_palette = "Catppuccin Mocha Mauve-Lavender";
        builtin = "Catppuccin";
        mode = "dark";
        wallpaper_scheme = "m3-content";
      };
      wallpaper = {
        enable = true;
        directory = "${config.xdg.configHome}/wallpapers"; 
        default.path = "${config.xdg.configHome}/wallpapers/wallpaper3.png";
      };
      wallpaper.enabled = false;
      bar.default = {
        margin_ends = 0;
        margin_edge = 0;
        radius = 0;
        border_width = 0.0;
      };
      shell.panel = {
        launcher_placement = "floating";
        launcher_position = "top_left";
        floating_offset = 10;
      };
      shell.shadow.alpha = 0.0;
    };
  };
}
