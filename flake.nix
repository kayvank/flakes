    {
  description = "flake template for various devShells";

  inputs = {
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
        pkgs,
        system,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "nix devShell";
          buildInputs = with pkgs;
          with pkgs; [
            nil
            alejandra
          ];
        };
      };
      flake = {
        templates = rec {
          default = cabal;
          nix = {
            path = ./template/nix;
            description = ''
              A basic Nix devShell.
            '';
          };
          cabal = {
            path = ./template/cabal;
            description = ''
              A devShell template for Haskell Cabal projects.
            '';
          };
          nix_basic = {
            path = ./template/nix_basic;
            description = ''
              A devShell template for Haskell Cabal projects.
            '';
          };
          rust = {
            path = ./template/rust;
            description = ''
              A devShell template for Rust projects.
            '';
          };
          tex = {
            path = ./template/tex;
            description = ''
              A devShell template for LaTeX projects.
            '';
          };
        };
      };
    };
}
