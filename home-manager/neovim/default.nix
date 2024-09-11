{ pkgs, lib, config, ...}:
{
  programs.neovim = {
        enable = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
          #colorscheme
          vim-code-dark
          nvim-solarized-lua
          #icons
          nvim-web-devicons
          #start screen
          vim-startify
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
          #snippet engine, collection and completion source
          luasnip
          friendly-snippets
          cmp_luasnip
          #native lsp config engine, completion source
          nvim-lspconfig
          cmp-nvim-lsp
          #formatting, linting and diagnostics
          none-ls-nvim
        ];
	extraLuaConfig = ''
	print("bonjour")
	${builtins.readFile ./init.lua}
	'';

        # extraConfig = ''
        #   lua << EOF
        #     local binaries = {
        #       tsserver_path = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
        #     }
        #     vim.api.nvim_command('autocmd VimEnter * lua print("bonjour")')
        #
        #     ${builtins.readFile ./config/init.lua}
        #   EOF
        # '';
      };

      home.packages = with pkgs; [
        rust-analyzer
        vue-language-server
        typescript
        typescript-language-server

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

      xdg.configFile.nvim = {
        source = ./lua;
	target = "nvim/lua";
        recursive = true;
      };
    }
