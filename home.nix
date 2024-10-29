{ config, pkgs, ... }:

{
  home.username = "artem";
  home.homeDirectory = "/home/artem";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (pkgs.python311.withPackages (python-pkgs: [
      python-pkgs.numpy
      python-pkgs.jupyter
      python-pkgs.matplotlib
      python-pkgs.sympy
      python-pkgs.scipy
      python-pkgs.pandas
      python-pkgs.shapely
      python-pkgs.faker
      python-pkgs.tqdm
     ]))
    # uv
    devenv

    typst
    typst-lsp
    flameshot
    pandoc
    
    pcmanfm
    pavucontrol
    gimp
    btop
    onlyoffice-bin
    obsidian
    lutris
    okular
    planify
    
    xclip
    networkmanagerapplet
    distrobox
    texlive.combined.scheme-full

    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "FantasqueSansMono"]; })
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    openmoji-color
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    noto-fonts-cjk-sans
    comic-mono
    comic-relief
    overpass

    revolt-desktop
    teamspeak5_client
  ];

  fonts.fontconfig.enable = true; 

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs = {
    helix = {
      enable = true;
      defaultEditor = true;

      settings = {
        # theme = "kanagawa";

        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };

    zathura = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    direnv.enable = true;

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [ 
        bbenoist.nix 
      ];
      userSettings = {
        "files.autoSave" = "afterDelay";
        "[nix]"."editor.tabSize" = 2;
        "python.linting.enabled" = "true";
        "workbench.iconTheme" = "eq-material-theme-icons-ocean";
      };
    };

    alacritty = {
      enable = true;
    };

    rofi.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
      userName = "Cosheimil";
      userEmail = "a.varvus@ya.ru";

      extraConfig = {
        push = {
          autoSetupRemote = true;
          default = "current";
        };
        init.defaultBranch = "main";
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };

  services.picom = {
   enable = true;
   # package = pkgs.picom-pijulius;
   # vSync = true;
   shadow = true;
   backend = "glx";
   activeOpacity = 0.9;
   wintypes = {
     popup_menu = { opacity = config.services.picom.menuOpacity; };
     dropdown_menu = { opacity = config.services.picom.menuOpacity; };
   };
   fade = true;
   fadeDelta = 4;
   settings = {
    blur = {
      method = "dual_kawase";
      strength = 8;
      background = true;
    };
    corner-radius=5;
   };
  };


  home.sessionVariables = {
    EDITOR = "hx";
    # LD_LIBRARY_PATH=''${pkgs.lib.makeLibraryPath [
    #   pkgs.stdenv.cc.cc
    # ]}'';
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    # HIP_VISIBLE_DEVICES=1;
    # HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    # PYTORCH_ROCM_ARCH="gfx1030";
    NIXPKGS_ALLOW_UNFREE=1;
  };

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

  stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };

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
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.polarity = "dark";
  programs.home-manager.enable = true;
}
