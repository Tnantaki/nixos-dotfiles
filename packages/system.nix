{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [ # all user packages
    # Development
    wget
    curl
    gnumake
    binutils
    pkg-config
    starship
    vscode
    zed-editor
    kdePackages.kdenlive
    mkvtoolnix

    # Language servers
    rust-analyzer
    package-version-server # handles hover information in package.json files
    nixd # Nix language server
    nil # Nix language server
    nixfmt-rfc-style

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
    android-tools # adb, fastboot, etc.
    pulseaudio
    watchman
    jdk

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

    # KDE
    kdePackages.sddm-kcm # allow to customize the login screen
    # Optional
    kdePackages.kirigami-addons # KDE's UI framework for creating responsive interfaces
    kdePackages.kirigami # KDE's UI framework for creating responsive interfaces
    kdePackages.ksvg # handles SVG rendering

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
    nvtopPackages.v3d # monitor GPU, Provide 'nvtop' command
    stow
    dysk # Disk Info display
    tldr # short form of man command
    zoxide # cd with cache
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    zstd
    stdenv.cc.cc
    curl
    openssl
    attr
    libssh
    bzip2
    libxml2
    acl
    libsodium
    util-linux
    xz
    systemd
  ];

  services.transmission = {
    enable = true;
    openRPCPort = true;
    user = "tnantaki";
    group = "users";
    settings = {
      download-dir = "/mnt/archive/Downloads";
      umask = 2; # Makes files readable by group
    };
  };
}
