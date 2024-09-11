{ pkgs, lib, config, ...}:
{
  programs.neovim = {
        enable = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          #NB:at least, following plugins that some of installed
          #ones depend on, are not specified, as nix installs
          #those automatically:
          # -plenary

          ## core
          #treesitter
          #TODO:fix todos
          nvim-treesitter.withAllGrammars
          #colorscheme
          vim-code-dark
          nvim-solarized-lua
          #icons
          nvim-web-devicons
          #start screen
          #TODO:maybe switch to something else
          #seems to be dead, but still works, whatever
          vim-startify
          #status line
          #works best for me, at least, for now
          #TODO:maybe switch to something else
          lightline-vim
          #pipe the statusline into tmux
          vim-tpipeline
          #git stuff
          vim-signify
          #powerful fuzzy search ui engine with some basic modules
          telescope-nvim
          #native module for fuzzy search
          telescope-fzy-native-nvim
          #don't hightlight when done searching
          vim-cool
          #keep undo history
          undotree
          #keymap hints
          which-key-nvim
          #spam v/V to select
          vim-expand-region
          #jump quickly
          flash-nvim
          #file tree
          neo-tree-nvim

          ##advanced editing
          #automatic comments, but in lua
          #TODO:maybe switch to comment.nvim
          kommentary
          #automatic surrounds, but in lua
          nvim-surround
          #text object engine
          vim-textobj-user
          #select the entire buffer
          vim-textobj-entire
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
          # null-ls-nvim
          none-ls-nvim

          #misc
          #color previews
          vim-hexokinase

          #writing
          knap
          orgmode
        ];
	extraLuaConfig = ''
	print("bonjour")
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
        source = ./config;
        recursive = true;
      };
    }
