{inputs,lib,config,pkgs, ... }:
{
  # home-manager.users.jp = {pkgs, ...}: {
  #   home.stateVersion = "23.05";
  #   home.packages = [
  #   ];
  # };
  users.users.jp = {
    isNormalUser = true;
    description = "jp";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      autojump
      darktable
      fish
      flowblade
      firefox
      google-chrome
      helix
      hexchat
      kitty
      rofi
      seafile-client
      speedtest-cli
      spotify
      trash-cli
      vscode
      waybar
      hyprpaper
      dolphin
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    (import (fetchTarball https://install.devenv.sh/latest)).default
    bat
    kate
    pkgs.jetbrains.pycharm-community
    unzip
    neofetch
    nvtop
    powertop
    swtpm
    tldr
    wireshark
    wget
    weechat
    vim
    ];

  #enable steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
    # Enable home-manager and git
  # programs.home-manager.enable = true;
  programs.git.enable = true;
}