{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # devenv.url = "github:cachix/devenv";
  };

  outputs = { nixpkgs, home-manager, stylix, disko, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in {
      nixosConfigurations = {
        x220t = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/x220t/configuration.nix
            stylix.nixosModules.stylix
            disko.nixosModules.disko
          ];
        };

        z820 = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/z820/configuration_new.nix
            stylix.nixosModules.stylix
            disko.nixosModules.disko
          ];
        };
      };
   
      homeConfigurations = {
        x220t = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          modules = [
            stylix.homeManagerModules.stylix 
            ./home-manager/x220t/home.nix
          ];
        };

        z820 = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          modules = [
            stylix.homeManagerModules.stylix 
            ./home-manager/z820/home.nix
          ];
         };
      };

      homeConfigurations.artem = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ stylix.homeManagerModules.stylix ./home-manager/home.nix ];
      };
    };
}
