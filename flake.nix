{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos.url = "nixpkgs/23.11";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixos,
    ...
  }: {
    nixosConfigurations = {
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
