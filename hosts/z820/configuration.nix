{ config, lib, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ 
    "quiet" 
    "video=DP-0:2560x1440@165"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.amdgpu.initrd.enable = true;


  security.doas.enable = true;
  security.sudo.enable = false;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8" ];

  services.xserver = {
    enable = true;

    # modules = [ pkgs.xf86_input_wacom ];
    # wacom.enable = true;
  
    displayManager = {
        sddm.enable = true;
        defaultSession = "none+awesome";
    };

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
  };

  # services.teamviewer.enable = true;

  # services.touchegg.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
  };
  # nixpkgs.config.pulseaudio = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.artem= {
    isNormalUser = true;
    # initialPassword = "pi";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
  };


  programs.nix-ld.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.v2raya.enable = true;
  # systemd.services.v2raya = {
  #   enable = true;
  #   description = "v2rayA gui client";
  #   after = [ "network.target" ];
  #   # serviceConfig = {
  #     # Restart = "always";
  #     # ExecStart = "${unstable.v2raya}/bin/v2rayA";
  #   # };
  #   path = with pkgs; [ iptables bash ];
  #   wantedBy = [ "multi-user.target" ];
  # };

  
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      rocmPackages.clr
      rocmPackages.rocminfo
      rocmPackages.rocm-runtime
    ];
    # driSupport = true;
    # driSupport32Bit = true;
  };
  environment.variables = {
    HSA_OVERRIDE_GFX_VERSION="10.3.0";
  };

  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.amdvlk.enable = true;

  # services.ollama = {
  #   enable = true;
  #   acceleration = "rocm";
  #   rocmOverrideGfx = "10.3.0";
  # };

  programs.steam.enable = true;
  # programs.steam.gamescopeSession.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "artem" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  # services.cachix-agent.enable = true;
  # services.cachix-watch-store.enable = true;
  # services.cachix-watch-store.jobs = 32;

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  stylix.enable = true;
  stylix.base16Scheme = {
    base00 = "1F1F28";
    base01 = "2A2A37";
    base02 = "223249";
    base03 = "727169";
    base04 = "C8C093";
    base05 = "DCD7BA";
    base06 = "938AA9";
    base07 = "363646";
    base08 = "C34043";
    base09 = "FFA066";
    base0A = "DCA561";
    base0B = "98BB6C";
    base0C = "7FB4CA";
    base0D = "7E9CD8";
    base0E = "957FB8";
    base0F = "D27E99";
  };

  stylix.image = /home/artem/wallpaper.jpg;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 18;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
    sizes = {
      terminal = 10;
    };
  };

  stylix.polarity = "dark";

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.x2goserver.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}

