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
    ./hardware-config-iso.nix
    #"${modulesPath}/installer/cd-dvd/channel.nix"
  ];
  environment.systemPackages = with pkgs; [ firefox ]

  # nix.settings.experimental-features = ["nix-command" "flakes"];
  #
  # networking.hostName = "nixos"; # Define your hostname.
  # # Set your time zone.
  # time.timeZone = "Asia/Kuala_Lumpur";
  #
  # # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  #
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "fr_FR.UTF-8";
  #   LC_IDENTIFICATION = "fr_FR.UTF-8";
  #   LC_MEASUREMENT = "fr_FR.UTF-8";
  #   LC_MONETARY = "fr_FR.UTF-8";
  #   LC_NAME = "fr_FR.UTF-8";
  #   LC_NUMERIC = "fr_FR.UTF-8";
  #   LC_PAPER = "fr_FR.UTF-8";
  #   LC_TELEPHONE = "fr_FR.UTF-8";
  #   LC_TIME = "fr_FR.UTF-8";
  # };
  #
  # networking.networkmanager.enable = true;
  # users.extraUsers.eli.extraGroups = [ "wheel" ];
  # home-manager = {
  #   users = {
  #     eli = import ../../home.nix;
  #   };
  # };
  # programs.zsh.enable = true;
  # users.users.eli = {
  #   isNormalUser = true;
  #   description = "eli";
  #   initialPassword = "mdp";
  #   extraGroups = ["networkmanager" "wheel" "input" "audio" "docker"];
  #   packages = with pkgs; [];
  #   shell = pkgs.zsh;
  # };
  # #services.xserver.enable = true;
  # #services.xserver.displayManager.sddm.enable = true;
  # #services.xserver.desktopManager.plasma5.enable = true;
  # #
  #
  # #services.xserver.displayManager.defaultSession = "plasmawayland";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };
  #
  # # Configure keymap in X11
  # services.xserver = {
  #   layout = "fr";
  #   xkbVariant = "";
  # };
  #
  # # Configure console keymap
  # console.keyMap = "fr";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
