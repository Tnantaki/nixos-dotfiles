{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [ # all user packages
    # Development
    wget
    curl
    gnumake
    binutils
    pkg-config
    openssl
    starship
    vscode
    zed-editor
    kdePackages.kdenlive
    mkvtoolnix
    dbeaver-bin
    docker

    # Language servers
    rust-analyzer
    package-version-server # handles hover information in package.json files
    nixd # Nix language server
    nil # Nix language server
    nixfmt-rfc-style

    # For proc-macro compatibility on Rust
    libllvm
    libclang
    
    #Cromium Dependency
    chromium
    glib
    nss
    nspr
    atk
    at-spi2-atk
    libdrm
    gtk3
    pango
    cairo
    gdk-pixbuf
    harfbuzz
    freetype
    fontconfig
    cups
    libGL
    mesa
    alsa-lib
    libxkbcommon
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libXScrnSaver
    xorg.libXi
    xorg.libxcb

    # Compiler, Runtime, Package Management
    gcc
    cargo
    rustc
    rustup
    nodejs_24
    bun
    python313Packages.pip
    python311

    # Android development
    android-studio
    android-tools # adb, fastboot, etc.
    pulseaudio
    # watchman
    jdk

    # Virtualization tools
    # virt-manager # KVM
    # qemu # KVM
    # libvirt # KVM

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
    easyeffects # custom sound audio
    imagemagick # create, edit, compose, or convert bitmap images
    exiftool # display info images
    upscayl
    
    # tmp
    vulkan-tools
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
