{ pkgs, config, inputs, ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        source = "builtin";
        builtin = "Catppuccin Mocha Mauve-Lavander";
      };
      wallpaper.enabled = false;
    };
  };
}
