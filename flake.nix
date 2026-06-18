{
  description = "ZMK dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        (pkgs.python312.withPackages (ps: [
          ps.west
          ps.pyelftools
          ps.setuptools
          ps.protobuf
          ps.grpcio
          ps.grpcio-tools
        ]))
        pkgs.protobuf
        pkgs.cmake
        pkgs.ninja
        pkgs.gnumake
        pkgs.dtc
        pkgs.git
        pkgs.gcc-arm-embedded
      ];
    };
  };
}
