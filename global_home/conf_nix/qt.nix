{ pkgs, config, inputs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    (catppuccin-kvantum.override {
      variant = "macchiato";
      accent = "mauve";
    })
  ];
}
