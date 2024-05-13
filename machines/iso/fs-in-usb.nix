{
  lib,
  ...
}:{
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
}
