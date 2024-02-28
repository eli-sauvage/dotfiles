{ config, pkgs, lib, ... }:

{
  home.username = "eli";
  home.homeDirectory = "/home/eli";
  home.stateVersion = "23.11"; # Don't change

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "UbuntuMono" ]; })
    obsidian
    lazydocker
    ripgrep
    unzip
    trashy
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
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    initExtra = "tmux";
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "docker-compose" "tmux" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      "ll" = "ls -l";
      "la" = "ls -la";
      ".." = "cd ..";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
      "trash" = "trashy";
    };
  };


  dconf.settings = {
    "org/gnome/Console" = {
      use-system-font = false;
      custom-front = "UbuntuMono Nerd Font Mono 11";
    };
  };

  #dotfiles
  home.file = with config.lib.file; {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/nvim" = {
      source = mkOutOfStoreSymlink ./dotfiles/.config/nvim;
      recursive = true;
    };
    ".config/lazydocker/config.yml".source = mkOutOfStoreSymlink ./dotfiles/.config/lazydocker/config.yml;
    # ".oh-my-zsh" = {
    #   source = mkOutOfStoreSymlink ./dotfiles/.oh-my-zsh;
    #   recursive = true;
    # };
    # ".zshrc".source = mkOutOfStoreSymlink ./dotfiles/.zshrc;
    ".tmux" = {
      source = mkOutOfStoreSymlink ./dotfiles/.tmux;
      recursive = true;
    };
    ".tmux.conf".source = mkOutOfStoreSymlink ./dotfiles/.tmux/.tmux.conf;
    ".tmux.conf.local".source = mkOutOfStoreSymlink ./dotfiles/.tmux.conf.local;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
