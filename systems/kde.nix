{ ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  
  services.displayManager.sddm = {
    enable = true;
    # settings = {
    #   Theme = {
    #     Background = "/path/to/your/wallpaper.jpg";
    #     # or for the breeze theme specifically:
    #     Current = "breeze";
    #   };
    # };
  };

}
