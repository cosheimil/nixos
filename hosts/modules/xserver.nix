{ ... }: {
  services.xserver = {
    enable = true;

    displayManager = { lightdm = { greeters = { pantheon.enable = true; }; }; };

    # windowManager.awesome = {
    #   enable = true;
    #   luaModules = with pkgs.luaPackages; [
    #     luarocks # is the package manager for Lua modules
    #     luadbi-mysql # Database abstraction layer
    #   ];
    # };

    windowManager.qtile = {
      enable = true;
      # extraPackages = python3Packages: with python3Packages; [ qtile-extras ];
    };
  };
}
