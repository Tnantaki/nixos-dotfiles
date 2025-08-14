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
    android-tools # adb, fastboot, etc.
    pulseaudio

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
    
    # X11 libraries
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXi
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXfixes
    xorg.libxkbfile
    xorg.libxcb
    xorg.xcbutil
    xorg.xcbutilkeysyms
    xorg.xcbutilimage
    xorg.xcbutilrenderutil
    
    # Add these Qt-related packages:
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5.qtx11extras
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtdeclarative
    qt5.full  # This includes platform plugins
    
    # Additional X11/graphics libraries that might be missing:
    xorg.libxshmfence
    xorg.libXdamage
    xorg.libXxf86vm
    wayland
    fontconfig
    freetype
    
    # Audio libraries (Android emulator needs these):
    libpulseaudio
  
    # libraries
    libxkbcommon
    libdrm
    libpng
    nss
    nspr
    expat
    libbsd
    xcb-util-cursor
    
    # Graphics stack
    mesa
    libGL
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
