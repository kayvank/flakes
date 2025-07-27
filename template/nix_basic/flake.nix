{
  description = "Basic nix devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
  flake-parts.lib.mkFlake {inherit inputs;} {
    systems = builtins.attrNames nixpkgs.legacyPackages;
    perSystem = {
      config,
      self',
      inputs',
      pkgs,
      system,
      ...
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        name = "nix devShell";
        buildInputs = with pkgs;
        with pkgs; [
          nil
          nixfmt-rfc-style
          figlet
        ];
        shellHook = ''
            set -o vi
            echo nix dev env | figlet -f cybermedium
          '';

      };
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://cache.iog.io"
      "https://cache.sc.iog.io"
    ];
    extra-trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "cache.sc.iog.io:b4YIcBabCEVKrLQgGW8Fylz4W8IvvfzRc+hy0idqrWU="
    ];
    allow-import-from-derivation = true;
    accept-flake-config = true;
  };
}
