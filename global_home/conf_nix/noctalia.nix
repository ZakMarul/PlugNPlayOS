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
      idle = {
        pre_action_fade_seconds = 3.0;

        behavior = {
          lock = {
            action = "lock";
            timeout = 900;
          };

          screen-off = {
            action = "screen_off";
            timeout = 1800;
          };
        };
      };
      notification.position = "top_right";
      hooks.started = "noctalia msg session lock";
      wallpaper = {
        enabled = true;
        directory = "${config.xdg.configHome}/wallpapers";
        default.path = "${config.xdg.configHome}/wallpapers/wallpaper3.png";
        fill_mode = "crop";
      };
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
