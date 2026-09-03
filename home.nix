{ config, pkgs, ... }:


{

  # Basic information and file path
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";


  # Home user packages
  home.packages = with pkgs; [
    #---Terminal Utilities---
    yazi
    btop
    htop
    #---Core Pkgs---
    neovim
    git
    fzf
    #---Developer tools and packages---
    lua
    luajit
    python3
    #---Full Applications---
    onlyoffice-desktopeditors
    inkscape
    blender
    #---Aesthetics---
    cmatrix
    fastfetch
    #---Desktop Environment
    catppuccin-kde
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


  # Kitty configuration
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Frappe";
  };

  # Starship prompt configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;


  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      share = true;
      extended = true;
    };

    shellAliases = {
    "nix-sysbuild" = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#nixos";
    "nix-resync" = "cd /etc/nixos && sudo nix flake update";
    };

    initContent = ''
      # Pametno traženje kroz povijest sa strelicama gore/dolje
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

    '';
  };


  #Firefox configuration
  home.file.".config/mozilla/firefox/profiles.ini".force = true;

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        id = 0;
        name = "Default Profile";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
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
      };
    };
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };
    };
  };


  #Plasma configuration
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "Catppuccin-Frappe-Blue";
      iconTheme = "breeze-dark";
      cursor.theme = "breeze_cursors";
      wallpaper = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/k8/wallhaven-k898gq.jpg";
        sha256 = "sha256-BjREdU8AqHatcnVdpGE09kPrQTTt1mIagiHfLRSxPVw=";
      };
    };

    configFile = {
      "kdeglobals"."General"."TerminalApplication" = "kitty";
      "kdeglobals"."General"."TerminalService" = "org.kde.kitty.desktop";
      "kdeglobals"."Applications"."TerminalApplication" = "kitty";
      "kdeglobals"."Applications"."TerminalService" = "org.kde.kitty.desktop";
      "ksplashrc"."KSplash"."Theme" = "catppuccin-frappe-blue";
      "kdeglobals"."KDE"."widgetStyle" = "Breeze";
      "kwinrc"."org.kde.kdecoration2"."library" = "org.kde.breeze";
      "kwinrc"."org.kde.kdecoration2"."theme" = "Breeze";
    };
  };

  programs.home-manager.enable = true;
}
