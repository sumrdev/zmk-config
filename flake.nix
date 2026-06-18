{
  description = "Minimal ZMK Firmware Dev Environment with Python 3.13";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: {
    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      pkgs.mkShellNoCC {
        packages = [
          pkgs.git
          pkgs.gh
          pkgs.python313
        ];

        shellHook = ''
          echo "🐍 ZMK Shell (Python 3.13) 🐍"
          echo "Run: python -m venv .venv --without-pip && source .venv/bin/activate"
          echo "Then: curl -sSL https://bootstrap.pypa.io/get-pip.py | python && pip install zmk"
        '';
      };
  };
}
