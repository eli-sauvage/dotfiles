{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration-dell-g3.nix
    ./configuration.nix
    ./keyd.nix
    ./sound.nix
  ];
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    devices = ["nodev"];
    efiSupport = true;
  };

  networking.networkmanager.enable = true;
  home-manager = {
    users = {
      eli = import ./home.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
