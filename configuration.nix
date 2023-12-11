{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      /home/jp/.config/nixos/hardware-configuration.nix
      /home/jp/.config/nixos/packages.nix
      /home/jp/.config/nixos/hardware.nix
      /home/jp/.config/nixos/bootloader.nix
      /home/jp/.config/nixos/environment.nix
      /home/jp/.config/nixos/networking.nix
      /home/jp/.config/nixos/services.nix
      /home/jp/.config/nixos/sound.nix
    ];
  system.stateVersion = "23.11"; # Did you read the comment?
}
