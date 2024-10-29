{ config, pkgs, ... }: {
  home.stateVersion = "24.11";
  home.username = "artem";
  home.homeDirectory = "/home/artem";
  programs.home-manager.enable = true;

  imports = [
    ./usr-pkgs.nix
    ../modules/git.nix
    ../modules/direnv.nix
    ../modules/nu-shell.nix
    ../modules/hellix.nix
    ../modules/picom.nix
    ../modules/stylix.nix
    ../modules/vscode.nix
    ../modules/zellij.nix
    ../modules/zsh.nix
    ../modules/kitty.nix
    ../modules/firefox.nix
    ../modules/zathura.nix
    ../modules/alacritty.nix
    ../modules/feh.nix
    ../modules/fastfetch.nix
    ../modules/rofi.nix
    ../modules/pass.nix
  ];
}

