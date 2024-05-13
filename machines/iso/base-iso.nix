{
  pkgs,
  lib,
  config,
  options,
  modulesPath,
  ...
}: with lib;
{
  imports = [
    "${modulesPath}/installer/cd-dvd/iso-image.nix"
    ../../core-config.nix
  ];
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;

}
