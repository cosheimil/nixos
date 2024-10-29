{ pkgs, ... }: {
  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
    };
  in [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs;
      [
        rocmPackages.clr.icd
        # amdvlk
        # driversi686Linux.amdvlk
      ];
  };

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
