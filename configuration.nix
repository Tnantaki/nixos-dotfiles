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

  boot.kernelModules = [ "kvm-amd" ]; # KVM
  
  virtualisation.libvirtd.enable = true; # KVM

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

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
