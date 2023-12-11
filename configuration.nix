{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./hardware.nix
      ./bootloader.nix
      ./environment.nix
      ./networking.nix
      ./services.nix
      ./sound.nix
    ];
  system.stateVersion = "23.11"; # Did you read the comment?
}
