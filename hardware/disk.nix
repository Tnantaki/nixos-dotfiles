{ config, pkgs, ... }:

{
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
}