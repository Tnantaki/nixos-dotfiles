{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages/system.nix
      ./packages/font.nix
      ./programs/zsh.nix
      ./peripheral/keyboard.nix
      ./systems/network.nix
    ];

  # Bootloader.
  boot.loader.timeout = 0; # boot with latest generations, only hold special key will display boot generation list
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5; # list only 5 generations
  boot.loader.efi.canTouchEfiVariables = true;

  # Mount Disk
  fileSystems."/mnt/archive" = {
    device = "/dev/disk/by-uuid/4e149ab6-4527-4c19-8c7c-11dec5a4107e";
    fsType = "ext4";
    options = [ "nofail" "rw" ];
  };
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/3A287E27287DE1F5";
    fsType = "ntfs";
    options = [ "nofail" "rw" "uid=1000" "gid=100" ];
  };

  virtualisation.libvirtd.enable = true; # KVM

  boot.kernelModules = [ "kvm-amd" ]; # KVM

  networking.hostName = "nixos";
  
  networking.networkmanager.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "th_TH.UTF-8";
    LC_IDENTIFICATION = "th_TH.UTF-8";
    LC_MEASUREMENT = "th_TH.UTF-8";
    LC_MONETARY = "th_TH.UTF-8";
    LC_NAME = "th_TH.UTF-8";
    LC_NUMERIC = "th_TH.UTF-8";
    LC_PAPER = "th_TH.UTF-8";
    LC_TELEPHONE = "th_TH.UTF-8";
    LC_TIME = "th_TH.UTF-8";
  };

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
