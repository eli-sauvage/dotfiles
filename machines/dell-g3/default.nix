{config, lib, pkgs, ...}:{
  imports = [
    ./hardware/dell-g3.nix
    ./graphics.nix
  ];
}
