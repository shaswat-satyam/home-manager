{pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    opts = {
      relativenumbers = true;
      numbers = true;
    };
    defaultEditor = true;
    vimdiffAlias = true;
    extraPlugins = [pkgs.vimPlugins.obsidian-nvim];
    plugins.lualine.enable = true;
    colorscheme = "gruvbox";
    enableMan = true;
  };
}
