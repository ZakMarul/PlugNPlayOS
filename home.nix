{ config, pkgs, ... }:


{

  # Basic information and file path
  home.username = "marul";
  home.homeDirectory = "/home/marul";
  home.stateVersion = "26.05";


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
    kdePackages.dolphin
    rofi
    tmux
    #---Developer tools and packages---
    lua
    python3
    #---Full Applications---
    onlyoffice-desktopeditors
    inkscape
    blender
    zed-editor
    audacity
    localsend
    #---Aesthetics---
    cmatrix
    fastfetch
    #---Misc---
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

  # Kitty configuration
  programs.kitty = {
    enable = true;
  };
  xdg.configFile."kitty" = {
    source = ./conf/kitty;
    recursive = true;
  };

  # Starship prompt configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./conf/starship/starship.toml;

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

    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland.desktop
      fi
    '';


    initContent = ''
      # Pametno traženje kroz povijest sa strelicama gore/dolje
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # Box kursor
      _set_box_cursor() {
        echo -ne '\e[2 q'
    }
    precmd_funkcions+=(_set_box_cursor)
    zle-line-init() {
        _set_box_cursor
    }
    zle -N zle-line-init


      alias ls="eza --group-directories-first"
      alias ll="eza -l -g --icons --git --group-directories-first"
      alias la="eza -la -g --icons --git --group-directories-first"
      alias lt="eza --tree --level=2 --icons --group-directories-first"

    '';
  };

# Firefox configuration
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
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
        extensions.packages = with pkgs.firefox-addons; [
          ublock-origin
        ];
      };
    };
  };

  programs.home-manager.enable = true;
}
