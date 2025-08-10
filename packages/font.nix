{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
  ];
}