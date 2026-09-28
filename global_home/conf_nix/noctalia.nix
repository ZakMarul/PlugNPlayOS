{ pkgs, config, inputs, ... }:

{
  # 1. Uvoz modula mora biti ovdje, na samom vrhu (izvan programa)
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # 2. Ovdje idu postavke samog programa
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
