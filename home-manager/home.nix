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
    du-dust
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
    libreoffice-qt6
    brave
    bottles
  ];
  nixpkgs.config.allowUnfree = true;

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
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

  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      open_url_with = "xdg-open";
      visual_bell_duration = "0.2 linear";
      # hide_window_decorations = "yes";
      confirm_os_window_close = "0";
    };
    keybindings = {
      "f11" = "toggle_fullscreen";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11"; # Don't change

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
