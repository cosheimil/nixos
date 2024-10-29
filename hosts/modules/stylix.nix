{ pkgs, ... }: {
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
}
