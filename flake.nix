{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    ...
  }@inputs:{
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./core-config.nix
          ./sound.nix
          ./machines/dell-g3
	        ./home-manager/include-home-manager.nix
          inputs.home-manager.nixosModules.default
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
