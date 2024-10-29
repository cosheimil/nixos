{ pkgs, ... }:{
  users.users.artem= {
    isNormalUser = true;
    # initialPassword = "pi";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
  };
  programs.zsh.enable = true;
}
