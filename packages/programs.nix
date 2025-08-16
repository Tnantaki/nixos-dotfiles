{ config, pkgs, ... }:

{
  # Install in Program Modules
  # It will integration with NixOS for more optimization
  programs = {
    firefox.enable = true;
    chromium.enable = true;
    git.enable = true;
    vim.enable = true;
    partition-manager.enable = true; # KDE Partition Manager
    
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
      };
    };
  };
}