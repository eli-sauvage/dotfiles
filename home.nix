{ config, pkgs, lib, ... }:

{
  home.username = "eli";
  home.homeDirectory = "/home/eli";
  home.stateVersion = "23.11"; # Don't change

  # The home.packages option allows you to install Nix packages into your
  # environment.
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "UbuntuMono" ]; })
    obsidian
    lazydocker
    ripgrep
    unzip
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.4.16") "electron-25.9.0";
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
  programs.firefox.enable = true;
  programs.tmux.enable = true;

  dconf.settings = {
    "org/gnome/Console" = {
      use-system-font = false;
      custom-front = "UbuntuMono Nerd Font Mono 11";
    };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    #".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim;
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.config/nvim;
      recursive = true;
    };
    ".config/lazydocker/config.yml".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.config/lazydocker/config.yml;
    ".oh-my-zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.oh-my-zsh;
      recursive = true;
    };
    ".tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.tmux;
      recursive = true;
    };
    ".tmux.conf".source = ./dotfiles/.tmux/.tmux.conf;
    ".tmux.conf.local".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.tmux.conf.local;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eli/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
