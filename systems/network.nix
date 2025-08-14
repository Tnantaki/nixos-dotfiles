{ config, pkgs, ... }:

{
  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 80 443 19000 ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1024;
      to = 9999;
    }
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
