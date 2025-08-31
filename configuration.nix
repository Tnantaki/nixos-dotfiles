{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./systems/kde.nix
    ./systems/network.nix
    ./systems/locale.nix
    ./systems/audio.nix
    ./systems/users.nix
    ./hardware/disk.nix
    ./hardware/gpu.nix
    ./hardware/keyboard.nix
    ./packages/programs.nix
    ./packages/system.nix
    ./packages/font.nix
  ];
  
  nix.settings = {
    # Increase download-buffer size on RAM
    download-buffer-size = 524288000; # 500 MiB
    # download-buffer-size = 1073741824; # 1 GiB
    
    # Flake Cli
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Bootloader.
  boot.loader.timeout = 0; # boot with latest generations, only hold special key will display boot generation list
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5; # list only 5 generations
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Kernel modules and parameters
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];
  
  # Environment variables for Wayland + NVIDIA
  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";  # Fix cursor issues if any
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:
  # services.openssh.enable = true; # Enable the OpenSSH daemon

  system.stateVersion = "25.05"; # Did you read the comment?
}
