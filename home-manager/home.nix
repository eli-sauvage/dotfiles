{
  config,
  pkgs,
  lib,
  ...
}: {
  nixGL.packages = import <nixgl> {inherit pkgs;};

  imports = [./neovim];
  home.username = "elicolh";
  home.homeDirectory = "/home/elicolh";
  home.sessionPath = ["/home/elicolh/.local/bin"];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.ubuntu-mono
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
  ];
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
    history.share = true;
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
      "hmed" = "nvim ~/dotfiles/home-manager/home.nix && home-manager switch -f ~/dotfiles/home-manager/home.nix";
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
    package = config.lib.nixGL.wrappers.mesa pkgs.alacritty;
    settings = {
      terminal.shell = "zellij";
      colors.primary.foreground = "#FFFFFF";
      font.normal = {
        family = "UbuntuMono Nerd Font";
        style = "Regular";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
