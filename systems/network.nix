{ config, pkgs, ... }:

{
  networking = {
    # Open ports in the firewall.
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 80 443 19000 ];
    firewall.allowedTCPPortRanges = [
      {
        from = 1024;
        to = 9999;
      }
    ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };
}
