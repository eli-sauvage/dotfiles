

{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];
  isoImage = {
    makeEfiBootable = true;
    makeUsbBootable = true;
  };
}
