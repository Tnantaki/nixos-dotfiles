{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Development
    vim
    wget
    curl
    git
    zsh
    gnumake
    binutils
    pkg-config
    starship
    vscode
    zed-editor

    # Language servers
    rust-analyzer
    package-version-server # handles hover information in package.json files
    nixd # Nix language server
    nil # Nix language server
    
    # For proc-macro compatibility on Rust
    libllvm
    libclang

    # Compiler, Runtime, Package Management
    gcc
    cargo
    rustc
    rustup
    nodejs_24
    bun

    # Android development
    android-studio
    android-tools

    # Virtualization tools
    virt-manager # KVM
    qemu # KVM
    libvirt # KVM

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
    transmission_4
  ];

  services.transmission = {
    enable = true;
    openRPCPort = true;
  };
}
