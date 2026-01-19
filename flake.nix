{
  description = "Home Manager configuration of shaswat";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    };
    nixpkgsOld.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    stylix.url = "github:danth/stylix";
  };

  outputs =
    { nixpkgs, home-manager, nixvim, nixpkgsOld, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      oldPkgs =  import nixpkgsOld {
	system = system;
        config = {
          allowUnfree = true;
          permittedUnfreePackages = [
            "stremio-shell"
          ];
          permittedInsecurePackages = [
            "qtwebengine-5.15.19"
          ];
        };
      };
    in
    {
      homeConfigurations."shaswat" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          ./nixvim.nix
          nixvim.homeModules.nixvim
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
	extraSpecialArgs = {
	  inherit oldPkgs;
	};

      };
    };
}
