{ pkgs, ...}: {
  services.teamviewer.enable=true;
  services.printing.enable = true;
  services.gvfs.enable = true;
}
