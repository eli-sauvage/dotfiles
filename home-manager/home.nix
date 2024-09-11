{
config,
pkgs,
lib,
...
}: {
    imports = [ ./neovim ];
    home.username = "elicolh";
    home.homeDirectory = "/home/elicolh";

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
        google-cloud-sdk
        gcc
        nodejs_20
    ];
    nixpkgs.config.allowUnfree = true;
    # nvim config
    # home.file = with config.lib.file; {
    #   ".config/nvim" = {
    #     source = ./neovim;
    #     # source = builtins.fetchGit {
    #     #   url = "https://github.com/eli-sauvage/nvim-config";
    #     #   rev = "29661b76f1127f948da969f7e36b75d6b0a112e9";
    #     # };
    #   };
    # };

    #programs.firefox.enable = true;
    #programs.firefox.package = pkgs.firefox.override {
    #  cfg.speechSynthesisSupport = false; #saves 600mb
    #};

    programs.chromium = {
        enable = true;
        package = pkgs.ungoogled-chromium;
    };

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

    home.sessionVariables = {
        EDITOR = "nvim";
    };

   home.stateVersion = "24.11"; # Don't change


    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
