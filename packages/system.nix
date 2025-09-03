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
    rust-analyzer # use local
    package-version-server # handles hover information in package.json files
    nixd # Nix language server
    nil # Nix language server
    nixfmt-rfc-style

    # For proc-macro compatibility on Rust
    libllvm
    libclang
    
    #Cromium Dependency
    chromium

    # Compiler, Runtime, Package Management
    gcc
    # cargo # use local
    # rustc # use local
    # rustup # use local
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
    upscayl # upscale image
    dpkg # install deb file
    ffmpeg
    libwebp
    postman
    litecli
    
    # tmp
    vulkan-tools
  ];
  
  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig"; # Rust need this for openssl
  };
  
  programs.steam.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    
    # FFmpeg and media libraries
    ffmpeg-full
    ffmpeg-full.lib
    
    # Graphics
    libGL
    libGLU
    mesa
    
    # X11
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXfixes
    xorg.libXdamage
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXScrnSaver
    xorg.libXtst
    
    # GTK/GUI
    glib
    gtk3
    pango
    gdk-pixbuf
    cairo
    atk
    
    # Audio
    alsa-lib
    pulseaudio
    
    # Other common deps
    fontconfig
    freetype
    dbus
    nspr
    nss
    expat
    libuuid
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
