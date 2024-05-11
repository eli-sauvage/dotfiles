{
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    ./base-iso.nix
    "${modulesPath}/profiles/minimal.nix"
  ];
  environment.noXlibs = lib.mkForce false;
}
