{
  config,
  pkgs,
  lib,
  nixpkgs,
  ...
}: {
  home.username = "eli";
  home.homeDirectory = "/home/eli";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["UbuntuMono"];})
    #obsidian
    du-dust
    ripgrep
    unzip
    trash-cli
    tig
    lazygit
    htop
    github-cli
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.4.16") "electron-25.9.0";

  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
  #nvim config
  home.file = with config.lib.file; {
    ".config/nvim" = {
      source = builtins.fetchGit {
        url = "https://github.com/eli-sauvage/nvim-config";
        rev = "29661b76f1127f948da969f7e36b75d6b0a112e9";
      };
    };
  };

  #programs.firefox.enable = true;
  #programs.firefox.package = pkgs.firefox.override {
  #  cfg.speechSynthesisSupport = false; #saves 600mb
  #};

  programs.chromimum = {
    enable = true;
    package = pkgs.ungoogled-chromium;
  };
  	
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings.pane_frames = false;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };
    shellAliases = {
      "ll" = "ls -l";
      "la" = "ls -la";
      ".." = "cd ..";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "23.11"; # Don't change


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
