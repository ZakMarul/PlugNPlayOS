{
  description = "My Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Chaotic nyx flake
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    #Firefox external flake
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Noctalia flake
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, chaotic, firefox-addons, noctalia, ... }@inputs: {
    nixosConfigurations = {

      #AMD Desktop sustav
      pnp_amd = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop_AMD/configuration.nix
          chaotic.nixosModules.nyx-cache
          chaotic.nixosModules.nyx-overlay
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ noctalia.homeModules.default ];
              users.marul = import ./hosts/desktop_AMD/home/home.nix;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
            };
          }
        ];
      };

      # NVIDIA Laptop sustav
      pnp_nlt = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop_nvidia/configuration.nix
          chaotic.nixosModules.nyx-cache
          chaotic.nixosModules.nyx-overlay
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ noctalia.homeModules.default ];
              users.marul = import ./hosts/laptop_nvidia/home/home.nix;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
  };
}
