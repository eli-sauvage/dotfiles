
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];
  networking.networkmanager.enable = true;
  home-manager = {
    users = {
      eli = import ./home.nix;
    };
  };
  system.stateVersion = "23.11"; # Did you read the comment?
}
