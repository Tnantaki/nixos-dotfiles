{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,th";
    variant = "";
    options = "grp:win_space_toggle";

    # Add Manoonchai Layout
    extraLayouts = {
      th = {
        description = "Manoonchai Layout";
        languages = [ "tha" ];
        symbolsFile = ./Manoonchai_xkb;
      };
    };
  };

}