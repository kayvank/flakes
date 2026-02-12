flakes
====
Collection of nix flake templates

## What is this
development nix shells for 
- Haskell
- Rust
- LaTeX
- Nix
- JavaScript, deno+typescript

## How do I use it

### Haskell

``` sh
## cabal multi project
nix flake init -t "github:kayvank/flakes#multi-project-cabal"
## cabal single project
nix flake init -t "github:kayvank/flakes#single-project-cabal"
```

### Rust

``` sh
nix flake init -t "github:kayvank/flakes#rust"
```

### nix shell

``` sh
nix flake init -t "github:kayvank/flakes#nix_basic"
```

### local testing of templates

``` sh
## a simple nix project
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#nix_basic
## cabal multi project
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#multi-project-cabal
## cabal single project
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#single-project-cabal
```
