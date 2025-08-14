{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./systems/network.nix
    ./systems/locale.nix
    ./systems/audio.nix
    ./systems/users.nix
    ./hardware/disk.nix
    ./hardware/gpu.nix
    ./hardware/keyboard.nix
    ./packages/system.nix
    ./packages/font.nix
    ./programs/zsh.nix
  ];
  
  nix.settings = {
    # Increase download-buffer size on RAM
    download-buffer-size = 524288000; # 500 MiB
    # download-buffer-size = 1073741824; # 1 GiB
  };

  # Bootloader.
  boot.loader.timeout = 0; # boot with latest generations, only hold special key will display boot generation list
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5; # list only 5 generations
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.libvirtd.enable = true; # KVM

  boot.kernelModules = [ "kvm-amd" ]; # KVM

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.partition-manager.enable = true;

  # For customize background, Didn't test is it work
  # services.displayManager.sddm = {
  #     enable = true;
  #     settings = {
  #       Theme = {
  #         Background = "/path/to/your/wallpaper.jpg";
  #         # or for the breeze theme specifically:
  #         Current = "breeze";
  #       };
  #     };
  #   };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
