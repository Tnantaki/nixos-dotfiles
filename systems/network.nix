{ config, pkgs, ... }:

{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
