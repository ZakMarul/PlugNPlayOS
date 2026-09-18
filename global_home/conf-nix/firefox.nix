{ config, pkgs, inputs, ... }:

{
  #Firefox
  programs.firefox = {
  enable = true;
  profiles = {
    default = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
        "extensions.autoDisableScopes" = 0;
        "ui.systemUsesDarkTheme" = 1;
      };
      search = {
        force = true;
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        engines = {
          "DuckDuckGo" = {
            urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
            definedAliases = [ "@ddg" ];
          };
        };
      };

      extensions.packages = [
        inputs.firefox-addons.packages.${pkgs.system}.ublock-origin
        inputs.firefox-addons.packages.${pkgs.system}.vimium
      ];
    };
  };
};
}
