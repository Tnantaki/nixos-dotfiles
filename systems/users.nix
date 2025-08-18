{ pkgs, ... }:

{
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
}