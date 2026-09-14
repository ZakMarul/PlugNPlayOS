{ config, pkgs, inputs, ... }:


{

  # Basic information and file path
  home.username = "marul";
  home.homeDirectory = "/home/marul";
  home.stateVersion = "26.05";

  imports = [
    ./conf-nix/zsh.nix
    ./conf-nix/firefox.nix
  ];

  # Home user packages
  home.packages = with pkgs; [
    #---Terminal Utilities---
    yazi
    btop
    htop
    eza
    #---Core Pkgs---
    neovim
    git
    fzf
    nautilus
    rofi
    tmux
    kitty
    #---Developer tools and packages---
    lua
    python3
    #---Full Applications---
    onlyoffice-desktopeditors
    inkscape
    blender
    steam
    zed-editor
    audacity
    vesktop
    localsend
    vlc
    #---Aesthetics---
    cmatrix
    fastfetch
    awww
    #---Misc---
    gamescope
    nerd-fonts.jetbrains-mono
  ];


  # Home user session variables
  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    PAGER = "less";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    BROWSER = "firefox";
  };

  # Font configuration
  fonts.fontconfig.enable = true;

  # Hyprland configuration
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/conf/hyprland";
    recursive = true;
  };

  # Awww configuration
  xdg.configFile."wallpaper3.png".source = ./home/conf/wallpapers/wallpaper3.png;

  # Kitty configuration
  xdg.configFile."kitty" = {
    source = ./conf/kitty;
    recursive = true;
  };

  # Btop configuration
  xdg.configFile."btop/btop.conf" = {
    source = ./home/conf/btop/btop.conf;
  };
  xdg.configFile."btop/themes/catppuccin-mac.theme" = {
    source = ./home/conf/btop/themes/catppuccin-mac.theme;
  };

  # Starship prompt configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./home/conf/starship/starship.toml;

  # Cursor configuration
  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  programs.home-manager.enable = true;
}
