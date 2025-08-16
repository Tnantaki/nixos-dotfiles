{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    # home-manager.url = "github:nix-community/home-manager/release-25.05";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs"; # ensure home manager using the same version of nixpkgs
  };

  outputs = {self, nixpkgs, home-manager, ...}:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    # homeConfigurations = {
    #   tnantaki = home-manager.lib.homeManagerConfiguration {
    #     inherit pkgs;
    #     modules = [ ./home.nix ];
    #   };
    # };
  };
}