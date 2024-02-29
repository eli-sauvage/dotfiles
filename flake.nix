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
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixos-generators,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/chromebook/configuration-chromebook.nix
          inputs.home-manager.nixosModules.default
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
    };
    packages.x86_64-linux = {
      live = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ./machines/iso/configuration-iso.nix
        ];
        format = "iso";
      };
    };
  };
}
