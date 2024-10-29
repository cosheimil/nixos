{ config, lib, pkgs, ...}:{
  system.stateVersion = "23.11"; # Did you read the comment?
  imports = [
    ./hardware-configuration.nix

    ../modules/ssh.nix
    ../modules/xserver.nix
    ../modules/locale.nix
    ../modules/steam.nix
    ../modules/nixld.nix
    ../modules/sound.nix
    ../modules/virtualisation.nix
    ../modules/flatpak.nix
    ../modules/system-stable.nix
    ../modules/networking.nix
    ../modules/doas.nix
    ../modules/rocm.nix
    ../modules/nix-settings.nix
    ../modules/stylix.nix
    ../modules/users.nix
    ../modules/printer.nix
    ../modules/keyboard.nix
    ../modules/boot.nix
    ../modules/gnupg.nix
  ];
}
