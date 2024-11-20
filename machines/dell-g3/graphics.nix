{
  config,
  lib,
  pkgs,
  ...
}: {
  # temporay for for bottles error: Gdk-Message: 11:58:31.996: Error 71 (Protocol error) dispatching to Wayland display.
  # follow https://github.com/NixOS/nixpkgs/issues/353990
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["intel" "nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
