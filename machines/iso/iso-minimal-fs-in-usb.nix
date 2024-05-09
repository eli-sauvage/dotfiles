{
  config,
  pkgs,
  modulesPath,
  ...
}:{
  imports = [
    ./chromebook-specific.nix
    "${modulesPath}/profiles/minimal.nix"
  ];
  fileSystems."/" =
    { device = "/dev/disk/by-label/usbfs";
      fsType = "ext4";
      label = "nixos_usb";
      options = "defaults,relatime,noatime,discard";
    };
  fileSystems."/tmp" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = "nosuid,nodev,relatime,mode=1777";
  };
  environment.systemPackages = with pkgs; [
    git
    htop
    du-dust
  ];

}
