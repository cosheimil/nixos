{ inputs, pkgs, ... }: {
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
    ]))
    devenv
    # cachix

    typst
    typst-lsp
    texlive.combined.scheme-full
    texstudio

    pcmanfm
    pavucontrol
    gimp
    btop
    xournalpp
    onlyoffice-bin
    obsidian
    flameshot
    okular
    nitrogen
    qbittorrent
    vlc
    mattermost-desktop
    telegram-desktop
    dbeaver-bin
    qtpass

    xclip
    networkmanagerapplet

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
    (nerdfonts.override {
      fonts = [ "NerdFontsSymbolsOnly" "FantasqueSansMono" ];
    })

    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      background = "${/home/artem/wallpaper.jpg}";
      loginBackground = true;
    })
  ];
}

