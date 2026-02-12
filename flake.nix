{
  description = "flake template for various devShells";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = builtins.attrNames nixpkgs.legacyPackages;
      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            name = "nix devShell";
            buildInputs =
              with pkgs;
              with pkgs;
              [
                nil
                alejandra
              ];
          };
        };
      flake = {
        templates = rec {
          default = multi-project-cabal;
          nix = {
            path = ./template/nix;
            description = ''
              A basic Nix devShell.
            '';
          };
          single-project-cabal = {
            path = ./template/single-project-cabal;
            description = ''
              A devShell template for Haskell Single-Project-cabal.
            '';
          };
          multi-project-cabal = {
            path = ./template/multi-project-cabal;
            description = ''
              A devShell template for Haskell Multi-Project-cabal projects.
            '';
          };
          nix_basic = {
            path = ./template/nix_basic;
            description = ''
              A devShell template for NixOS projects.
            '';
          };
          rust = {
            path = ./template/rust;
            description = ''
              A devShell template for Rust projects.
            '';
          };
          typescript = {
            path = ./template/typescript;
            description = ''
              A devShell template for typescript projects.
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
