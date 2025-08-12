{ config, pkgs, ... }:

{
  hardware.graphics.enable = true; # enable graphics acceleration like OpenGL, Vulkan, etc.
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };
}