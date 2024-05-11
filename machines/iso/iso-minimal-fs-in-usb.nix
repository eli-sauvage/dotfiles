{
  config,
  pkgs,
  modulesPath,
  lib,
  ...
}:{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];
  fileSystems."/" = lib.mkForce
    { device = "/dev/disk/by-label/usbfs";
      fsType = "ext4";
      label = "nixos_usb";
      options = ["defaults" "relatime" "noatime" "discard"];
    };
  fileSystems."/tmp" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = ["nosuid" "nodev" "relatime" "mode=1777"];
  };
  environment.systemPackages = with pkgs; [
    git
    htop
    du-dust
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
