# /etc/nixos/flake.nix
{
  description = "Pack's Flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /home/jp/.config/nixos/configuration.nix
        ];
      };
    };
  };
}
