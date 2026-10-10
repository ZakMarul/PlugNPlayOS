{ config, lib, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./general.nix
  ];

  # General
  networking.hostName = "pnp-laptop-nvidia";
  system.stateVersion = "26.05";

  # Graphics
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Nvidia
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
}
