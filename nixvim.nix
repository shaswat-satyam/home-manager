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
    plugins.lualine.enable = true;
    plugins.leetcode.enable = true;
    plugins.colorful-menu.enable = true;
    plugins.clipboard-image.enable = true;
    plugins.mini.enable = true;
    plugins.markview.enable = true;
    plugins.lsp.enable = true;
    plugins.fzf-lua.enable = true;
    plugins.rainbow.enable = true;
    plugins.telescope.enable = true;
    plugins.cmp = {
      autoEnableSources = true;
      settings.sources = [
        {name = "nvim_lsp";}
      ];
    };
    plugins.obsidian = {
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
      };
    };
    enableMan = true;
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.transparent_background = true;
    colorschemes.catppuccin.settings.show_end_of_buffer = true;
    clipboard.register = "unnamedplus";
    clipboard.providers.pbcopy.enable = true;

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
