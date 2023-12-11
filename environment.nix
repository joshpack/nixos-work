{ pkgs, ...}:
{
 nix = {
  package = pkgs.nixFlakes;
  extraOptions = ''
    experimental-features = nix-command flakes
  '';
};

users.users.jp = {
        shell = pkgs.nushell;
};


time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  elisa
  gwenview
  okular
  oxygen
  khelpcenter
  konsole
  plasma-browser-integration
  print-manager
  kwallet
];

 # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];

programs.hyprland.enable = true;
programs.sway.wrapperFeatures.gtk = true;
programs.thunar.enable = true;
programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
];
services.tumbler.enable = true; # Thumbnail support for Images.
}
