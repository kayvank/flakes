{
  description = "devShell for Rust projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    pre-commit-hooks,
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
        hook = pre-commit-hooks.lib.${system};
        tools = import "${pre-commit-hooks}/nix/call-tools.nix" pkgs;
      in rec
        {
        checks.pre-commit-check = hook.run {
          src = self;
          tools = tools;
          # enforce pre-commit-hook
          hooks = {
            rustfmt.enable = true;
            nixfmt-rfc-style.enable = true;
          };
        };

        devShells.default = pkgs.mkShell {
          name = "rust devShell";
          buildInputs = with pkgs;
          with pkgs.rustPlatform; [
            ## rust
            cargo
            rustc
            rustfmt
            rust-analyzer
            ## dev
            watchexec
            codespell
            figlet
            #nix
            #
            nixfmt-rfc-style
          ];
          shellHook = ''
            ${checks.pre-commit-check.shellHook}
            set -o vi
            export CARGO_HOME="$(pwd)/.cargo"
            export PATH="$CARGO_HOME/bin:$PATH"
            #
            # Application specific
            #
            ##export RUST_BACKTRACE=1
            ##export RUST_LOG='debug'
            # nerdfetch

            echo rust dev env | figlet -f cybermedium
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
