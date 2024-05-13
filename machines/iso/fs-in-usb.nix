{
  lib,
  ...
}:{
  system.activationScripts = { 
    stdio.text =
      ''
        mkfs.ext4 -L fsusb /dev/disk/by-label/fsusb
      '';
  }

  fileSystems."/" = lib.mkForce
    { device = "/dev/disk/by-label/fsusb";
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
