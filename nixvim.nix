{pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    waylandSupport = true;
    opts = {
      relativenumber = true;
      number = true;
    };
    defaultEditor = true;
    vimdiffAlias = true;
    plugins={
    lualine.enable = true;
    leetcode.enable = true;
    colorful-menu.enable = true;
    clipboard-image.enable = true;
    web-devicons.enable = true;
    mini.enable = true;
    mini-move = {
      enable = true;
      settings = {
        options = {
          reindent_linewise = true;
        };
       };
    };
    mini.mockDevIcons = true;
    mini.modules.icons.enable = true;
    mini-icons.enable = true;
    mini-icons.mockDevIcons = true;
    telescope.enable = true;
    fzf-lua.enable = true;
    treesitter = {
      enable = true;
    };
    markview.enable = true;
    lsp.enable = true;
    rainbow.enable = true;
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
        workspaces = [
	  {
	    name = "Second Brain";
	    path = "~/Shared/Notes";
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
    clipboard={
        register = "unnamedplus";
        providers.pbcopy.enable = true;
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
    lsp.servers."*" = {
      enable = true;
    };
  };
}
