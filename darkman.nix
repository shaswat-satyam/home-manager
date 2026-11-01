{ pkgs, ... }:

{
  services.darkman = {
    enable = true;

    settings = {
      lat = 12.9716;
      lng = 77.5946;
      usegeoclue = false;
    };

    darkModeScripts.kde = ''
      ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-colorscheme BreezeDark
    '';

    lightModeScripts.kde = ''
      ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-colorscheme BreezeLight
    '';
  };
}
