{ config, pkgs, ... }:

{
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

      alias ls="eza --group-directories-first"
      alias ll="eza -l -g --icons --git --group-directories-first"
      alias la="eza -la -g --icons --git --group-directories-first"
      alias lt="eza --tree --level=2 --icons --group-directories-first"

    '';
  };
}
