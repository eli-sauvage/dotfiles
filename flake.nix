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
    nixos,
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
      live-chromebook-minimal = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/iso/hardware/chromebook.nix
          ./machines/iso/minimal.nix
          ({isoImage.isoName = "chromebook-minimal.iso";})
        ];
      };
      live-chromebook-minimal-fsusb = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/iso/hardware/chromebook.nix
          ./machines/iso/minimal.nix
          ./machines/iso/fs-in-usb.nix
          ({isoImage.isoName = "chromebook-minimal-fsusb.iso";})
        ];
      };
      live-all-hardware-full = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	        ./machines/iso/full.nix
          "${inputs.nixpkgs}/nixos/modules/profiles/all-hardware.nix"
          inputs.home-manager.nixosModules.default
          ({isoImage.isoName = "all-hardware-full.iso";})
        ];
      };
    };
  };
}
