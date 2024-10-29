{ ... }:{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # auto-optimise-store = true;
      trusted-users = [ "root" "artem" ];
    };

    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    # };
  };
}
