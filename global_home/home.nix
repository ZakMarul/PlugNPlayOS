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
    obsidian
    marktext
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
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/global_home/conf/hyprland";
    recursive = true;
  };

  # Awww configuration
  xdg.configFile."wallpaper3.png".source = ./conf/wallpapers/wallpaper3.png;

  # Kitty configuration
  xdg.configFile."kitty" = {
    source = ./conf/kitty;
    recursive = true;
  };

  # Btop configuration
  xdg.configFile."btop/btop.conf" = {
    source = ./conf/btop/btop.conf;
  };
  xdg.configFile."btop/themes/catppuccin-mac.theme" = {
    source = ./conf/btop/themes/catppuccin-mac.theme;
  };

  # Starship prompt configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./conf/starship/starship.toml;

  # Cursor configuration
  home.pointerCursor = {
    enable = true;
    name = "catppuccin-macchiato-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = 28;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
}
