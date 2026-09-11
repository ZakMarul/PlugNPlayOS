{ config, lib, pkgs, ... }:

{
  #imports
  imports =
    [
      ./hardware-configuration.nix
    ];

  #Propriatary
  nixpkgs.config.allowUnfree = true;

  #General
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

  #Graphics
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  #Kernel
  boot.kernelPackages = pkgs.linuxPackages_cachyos-bore;

  #Timezone/Locale
  time.timeZone = "Europe/Zagreb";
  i18n.defaultLocale = "en_US.UTF-8";

  #Systemd
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #Login
  #---Service---
  services.getty.autologinUser = "marul";

  #Networking
  networking.hostName = "pnp";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  #Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  #---Service---
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  #---Service---
  services.blueman.enable = true;

  #TWM
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  #User configuration
  users.users.marul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$Ikx81SqLD09T/lex$Z1b39iorman4KbSmmn.eVrFTso7EHT4BGuCkT.Xxk42xhLduN7nNLGfkTQJx.10R7c75iCQEqqk7BEn5a3pO.0";
  };
  systemd.tmpfiles.rules = [
    "Z /etc/nixos        0755   marul     users     -"
  ];

  #System packages
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    nano
  ];


}
