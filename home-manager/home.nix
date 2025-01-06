{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./neovim];
  home.username = "elicolh";
  home.homeDirectory = "/home/elicolh";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["UbuntuMono"];})
    obsidian
    pandoc
    du-dust
    jq
    ripgrep
    unzip
    trash-cli
    tig
    lazygit
    htop
    github-cli
    google-cloud-sdk
    gcc
    nodejs_20
    # libreoffice-qt6
    # brave
    # bottles
    # lmstudio
    # linuxquota
    # atlauncher
    # gparted
    # nixgl.auto.nixGLDefault
    #    (blender.override {cudaSupport = true;})
  ];
  # ++ [bottles];
  # ++ [
  #   (import ./bottles.nix {inherit pkgs lib;})
  # ];
  nixpkgs.config.allowUnfree = true;

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_shell = "zsh";
      pane_frames = false;
      copy_command = "xclip -selection clipboard";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.share = false;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };
    shellAliases = {
      "ll" = "ls -l";
      "la" = "ls -la";
      ".." = "cd ..";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/dotfiles --option eval-cache false";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # rust-lang.rust-analyzer
      # tamasfe.even-better-toml
      # vue.volar
      mkhl.direnv
      vscodevim.vim
    ];
  };

  programs.alacritty = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
