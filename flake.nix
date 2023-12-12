{
  description = "Pack's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable"
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }@inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix];
        };
        work = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./systems/work/desktop/configuration.nix ];
        };
        home = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./systems/home/ROG_MAXIMUS_Z790_HERO/configuration.nix ];
        };
      };
    };
}
