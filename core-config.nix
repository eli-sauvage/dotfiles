{
  config,
  pkgs,
  lib,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 4*1024;
  } ];

  time.timeZone = "Europe/Paris";

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

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = [ "" "${pkgs.networkmanager}/bin/nm-online -q" ];
    };
  };
  users.extraUsers.elicolh.extraGroups = [ "wheel" ];

  programs.zsh.enable = true;
  users.users.elicolh = {
    isNormalUser = true;
    description = "elicolh";
    initialPassword = "mdp";
    extraGroups = ["networkmanager" "wheel" "input" "audio" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };


  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
    services.xserver = {
        enable = true;
        xkb = {
            layout = "fr";
            variant = "";
        };
    };
 environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  # services.displayManager.defaultSession = "plasma";

  # Configure console keymap
  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    wget
    git
    xclip
    kitty
  ];
  virtualisation.docker.enable = true;
  services.tailscale.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
