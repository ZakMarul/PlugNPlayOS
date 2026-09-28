{ pkgs, config, inputs, ...}:

{
  programs.noctalia-shell = {
    enable = true;

    settings = {
    theme = {
        source = "builtin";
        builtin = "Catppuccin";
      };
    };
  };

}
