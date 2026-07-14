{pkgs, ... }:
{
  programs.nixvim = {
    enable = false;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    waylandSupport = true;
    opts = {

      mouse = "a";
      splitbelow = true;
      splitright = true;
      timeoutlen = 1000;
      termguicolors = true;
      completeopt = "menuone,noselect";
      updatetime = 300;

      # Line Numbers
      relativenumber = true;
      number = true;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 4;
      sidescrolloff = 5;

      # search
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;

      # Tabs Handling
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      shiftround = true;
      smartindent = true;

      # Swap File
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;

      # Text Management
      list = true;
      foldmethod = "indent";
      foldlevel = 99;
      foldenable = false;
    };

    clipboard={
        register = "unnamedplus";
        providers.pbcopy.enable = true;
    };
    defaultEditor = true;
    vimdiffAlias = true;
    plugins={
      conform-nvim.enable = true;
      lualine.enable = true;
      leetcode.enable = true;
      colorful-menu.enable = true;
      clipboard-image.enable = true;
      web-devicons.enable = true;
      mini.enable = true;
      mini.mockDevIcons = true;
      mini-move = {
        enable = true;
        settings = {
          options = {
            reindent_linewise = true;
          };
         };
      };
      mini.modules.icons.enable = true;
      mini-icons.enable = true;
      mini-icons.mockDevIcons = true;

      fzf-lua.enable = true;
      treesitter = {
        enable = true;
      };
      markview = {
        enable = true;
        settings.preview.modes = ["n"];
      };
      lsp = {
        enable = true;
        servers = {
          html.enable = true;
          # htmx.enable = true;
          tailwindcss.enable = true;
          pylsp.enable = true;
          rubocop.enable = true;
          # texlab.enable = true;
          nixd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ts_ls.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          # sqls.enable = true;
          # zls.enable = true;
        };
      };
      nvim-tree.enable = true;
      rainbow.enable = true;
      image = {
        enable = true;
        autoLoad = true;
        # auto_render = true;
      };
      img-clip.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
        ];
      };
      obsidian = {
        enable = true;
        settings = {
          completion = {
            min_chars = 2;
            nvim_cmp = true;
          };
          new_notes_location = "current_dir";
          daily_notes = {
              folder = "Journal";
              date_format = "%Y-%m-%d";
              alias_format = "%B %-d, %Y";
              default_tags = [ "daily-notes" ];
            };
          workspaces = [
            {
              name = "Second Brain";
              path = "~/Shared/Notes";
            }
            {
              name = "Shared Second Brain";
              path = "~/Notes";
            }
          ];
          legacy_commands = false;
        };
      };
    };

    enableMan = true;
    colorschemes={
        catppuccin={
            enable = true;
            settings.transparent_background = true;
            settings.show_end_of_buffer = true;
        };
    };

    dependencies = {
      efm-langserver.enable = true;
      epub-thumbnailer.enable = true;
      ffmpegthumbnailer.enable = true;
      fd.enable = true;
      fzf.enable = true;
      git.enable = true;
      glow.enable = true;
      imagemagick.enable = true;
      lazygit.enable = true;
      rust-analyzer.enable = true;
      tree-sitter.enable = true;
      yazi.enable = true;
    };

  };
}
