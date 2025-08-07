let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC { # mkShellNoCC is like nix-shell but without cc (C-compiler)
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  GREETING = "Hello, Nix!"; # add env variables

  # 'shellHook' is the place for run command before entering shell environment
  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';
}