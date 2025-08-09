{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Development
    vim
    wget
    curl
    git
    zsh
    gcc
    gnumake
    binutils
    pkg-config
    starship
    cargo
    rustc
    rustup
    rust-analyzer
    nodejs_24
    bun
    vscode
    zed-editor
    # Internet
    google-chrome
    brave
    discord
    # Multimedia
    mpv
    vlc
    # Utils
    xclip
    ghostty
    bat
    htop
    ffmpeg
    file-roller
    rar
    unrar
    tree
    libnotify
  ];
}