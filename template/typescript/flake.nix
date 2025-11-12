{
  description = "Vite + Deno + React + TypeScript development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # The Deno runtime
            deno
            # Required for the Deno language server
            typescript
            # Tools for formatting and linting
            nodejs_22
            nodePackages.eslint_d # Fast, daemonized version of ESLint
            nodePackages.prettier
            # misc tools
            pkgs.codespell
            pkgs.figlet
            #nix
            pkgs.nixfmt-rfc-style
          ];

          # Configure ESLint and Prettier for the shell
          shellHook = ''
            npm install snarkjs@latest --save-dev

            export PATH=$PWD/node_modules/.bin:$PATH
            echo "TS Deno Vite dev shell" | figlet -f cybermedium
            #
            # to set up project
            # deno init --npm vite --template react-ts
          '';
        };
      });
}
