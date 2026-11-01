{ config, pkgs, oldPkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "shaswat";
  home.homeDirectory = "/home/shaswat";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.ripgrep
    pkgs.viu
    pkgs.chafa
    pkgs.ueberzugpp
    pkgs.marksman
    
    oldPkgs.stremio

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:

    (pkgs.writeShellScriptBin "edithome" ''
      nvim ~/.config/home-manager/
      echo "Updating Home Manager"
      home-manager switch
    '')

    (pkgs.writeShellScriptBin "jrnl" ''
      VAULT=~/Notes
      cd "$VAULT"
      nvim +"Obsidian dailies"
    '')

    (pkgs.writeShellScriptBin "notes" ''
      VAULT=~/Notes
      cd $VAULT
      nvim .
    '')
 

    (pkgs.writeShellScriptBin "editconf" ''
      set -e

      FLAKE="/etc/nixos"
      HOST=$(hostname)

      sudo -v

      sudo nvim $FLAKE/configuration.nix

      echo "Rebuilding flake for $HOST..."
      sudo nixos-rebuild switch 
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/shaswat/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "vi";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };

  home.file.".local/share/applications/nvim-notes.desktop".text = ''
  [Desktop Entry]
  Name=Notes 
  Comment=Open notes in Neovim
  Exec=notes
  Type=Application
  Categories=Utility;TextEditor;
  Terminal=true
  '';

  home.file.".local/share/applications/jrnl.desktop".text = ''
  [Desktop Entry]
  Name=jrnl
  Comment=Create/Edit a Journal Entry
  Exec=jrnl
  Type=Application
  Categories=Utility;TextEditor;
  Terminal=true
'';

# Bash CMD to create a new obsidian daily Notes
  programs.bash = {
    enable = true;
  };




  # Git Setup
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Shaswat Satyam";
        email = "0892928+shaswat-satyam@users.noreply.github.com";
      };
      credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
      push = { autoSetupRemote = true; };
    };
    settings = {
      init.defaultBranch = "main";
    };
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
