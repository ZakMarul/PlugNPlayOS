{ pkgs, config, inputs, ...}:

{
  programs.noctalia-shell = {
    imports = [
        inputs.noctalia.homeModules.default
      ];

    enable = true;
    settings = {
    theme = {
        source = "builtin";
        builtin = "Catppuccin";
      };
    };
  };

}
