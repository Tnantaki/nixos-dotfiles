{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = ''
      eval "$(starship init zsh)";
    '';

    shellAliases = {
      ".." = "cd ..";
      pbcopy = "xclip -selection c";
      pbpaste = "xclip -selection c -o";
      dotfile = "zeditor ~/.dotfiles";
      nixtran = "sudo cp -r ~/.dotfiles/* /etc/nixos";
    };
  };

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" ];
  };
}