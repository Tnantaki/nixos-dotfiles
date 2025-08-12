{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./systems/network.nix
      ./systems/locale.nix
      ./hardware/disk.nix
      ./hardware/gpu.nix
      ./hardware/keyboard.nix
      ./packages/system.nix
      ./packages/font.nix
      ./programs/zsh.nix
    ];

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.tnantaki = {
    isNormalUser = true;
    description = "PeterMos";
    extraGroups = [
      "networkmanager"
      "wheel"
      "transmission"
      "libvirtd" # KVM
      "qemu-libvirtd" # KVM
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  users.users.alice = {
    isNormalUser = true;
    description = "Alice";
    extraGroups = [ "networkmanager" ];
    shell = pkgs.zsh;
  };

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
