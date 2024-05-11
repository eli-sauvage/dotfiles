{
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    ./base-iso.nix
    ../../home-manager/include-home-manager.nix
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];
  
}
