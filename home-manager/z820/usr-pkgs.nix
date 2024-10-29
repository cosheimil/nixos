{ pkgs, inputs, ... }: {
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
    telegram-desktop

    xclip
    networkmanagerapplet
    distrobox
    texlive.combined.scheme-full

    (nerdfonts.override {
      fonts = [ "NerdFontsSymbolsOnly" "FantasqueSansMono" ];
    })
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
}
