{
  pkgs,
  lib,
  config,
  options,
  modulesPath,
  ...
}: with lib;
{
  networking.networkmanager.enable = true;
  networking.wireless.userControlled.enable = true;
  users.extraUsers.eli.extraGroups = [ "wheel" ];
  home-manager = {
    users = {
      eli = import ../../home.nix;
    };
  };
  programs.zsh.enable = true;
  users.users.eli = {
    isNormalUser = true;
    description = "eli";
    initialPassword = "mdp";
    extraGroups = ["networkmanager" "wheel" "input" "audio" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
