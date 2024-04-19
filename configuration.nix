# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  # nix-extras,
  ...
}: {
networking.firewall.enable = false;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos"; # Define your hostname.

  #services.tailscale.enable = true;
  #services.tailscale.useRoutingFeatures = "client";

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };
  
  #######GNOME#####
  # # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #
  # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  #######PLASMA#######
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  services.xserver.displayManager.defaultSession = "plasmawayland";

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.zsh.enable = true;
  users.users.eli = {
    isNormalUser = true;
    description = "eli";
    initialPassword = "mdp";
    extraGroups = ["networkmanager" "wheel" "input" "audio" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.4.16") "electron-25.9.0";


  programs.partition-manager.enable = true;
  #virtualisation.docker.enable = true;
  #virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "eli" ];
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    dotool
    git
    python3
    gcc
    gnomeExtensions.appindicator
    #libimobiledevice
    #ifuse
  ];
}
