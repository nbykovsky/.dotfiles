{
  description = "My System Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvimFlake.url = "github:nbykovsky/neovim";
    nvimFlake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nvimFlake, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true;};
    };
    lib = nixpkgs.lib;
  in {

    homeManagerConfigurations = {
      nik = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "nik";
        homeDirectory = "/home/nik";
        configuration = {
          imports = [
                  ({config, ...}: import ./users/nik/home.nix {inherit config nvimFlake pkgs;})
          ];
        };


	      stateVersion = "21.11"; 
      };
    };

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
                ./system/configuration.nix
        ];
      }; 
    };
  };
}
