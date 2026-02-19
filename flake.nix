{
  description = "Benj Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, ... }: {
    nixosConfigurations.benj-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            users.benj = { ... }: {
              imports = [
                nvf.homeManagerModules.default  
                ./home.nix
                ./modules/nvf/nvf.nix
              ];
            };
          };
        }
      ];
    };
  };
}
