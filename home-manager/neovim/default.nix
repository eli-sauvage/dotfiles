{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile.nvim = {
    source = ./lua;
    target = "nvim/lua";
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraLuaConfig = ''
      binaries = {
        vue_language_server_path = "${(pkgs.callPackage ./vue-ls.nix {})}/bin/vue-language-server"
      }
      ${builtins.readFile ./init.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-parsers.vue
      #colorscheme
      vim-code-dark
      nvim-solarized-lua
      #icons
      nvim-web-devicons

      #tabs
      barbar-nvim
      #status line
      #works best for me, at least, for now
      #TODO:maybe switch to something else
      lightline-vim
      #git stuff
      vim-signify
      telescope-nvim
      telescope-fzy-native-nvim
      undotree
      #keymap hints
      which-key-nvim
      #file tree
      neo-tree-nvim

      #automatic comments, but in lua
      kommentary
      #automatic surrounds, but in lua
      nvim-surround
      #autoclose parentheses, quotes, brackets, etc
      vim-closer

      ##intellisense
      #completion engine
      nvim-cmp
      #common completion sources
      cmp-buffer
      cmp-path
      cmp-zsh
      cmp-nvim-lua
      cmp-nvim-lsp-signature-help
      #snippet engine, collection and completion source
      luasnip
      friendly-snippets
      cmp_luasnip
      #native lsp config engine, completion source
      nvim-lspconfig
      lspsaga-nvim
      cmp-nvim-lsp
      #formatting, linting and diagnostics
      none-ls-nvim

      lazygit-nvim
    ];
  };

  home.packages = with pkgs; [
    rust-analyzer
    (pkgs.callPackage ./vue-ls.nix {})
    # vue-language-server.override {
    #   version = "2.1.6";
    # }
    typescript
    typescript-language-server

    pyright

    #x clipboard integration
    xclip
    #fast fzf
    ripgrep

    #linters, language servers, formatters, etc
    #general-purpose
    editorconfig-checker
    nodePackages.prettier
    #nix
    statix
    deadnix
    alejandra
    nil
    #yaml
    ansible-lint
    yamllint
    #lua
    lua53Packages.luacheck
    stylua
  ];
}
