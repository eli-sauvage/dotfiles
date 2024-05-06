# /etc/nixos/flake.nix
{
  inputs = {
    # configuration.nix. You can also use latter versions if you wish to
    # upgrade.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-extras = {
      url = "sourcehut:~dblsaiko/nix-extras";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos.url = "nixpkgs/23.11";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixos-generators,
    nix-extras,
    nixos,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/chromebook/configuration-chromebook.nix
          inputs.home-manager.nixosModules.default
          # nix-extras.nixosModules.nixosFull
          # nix-extras.packages
        ];
      };
      dell-g3 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/dell-g3/configuration-dell-g3.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      vbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/vbox/configuration-vbox.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      gce = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/gce/configuration-gce.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      live = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./machines/iso/configuration-iso.nix
        ];
      };
    };
  };
}
