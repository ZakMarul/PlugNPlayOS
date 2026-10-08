{ pkgs, inputs, config, ... }:

{
  programs.claude-code = {
    enable = true;
    package = inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {};
  };
}
