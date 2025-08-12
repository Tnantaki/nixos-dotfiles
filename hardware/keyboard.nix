{ config, pkgs, ... }:

{
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