flakes
====
Collection of nix flake templates

## What is this
development nix shells for 
- Haskell
- Rust
- LaTeX
- Nix

## How do I use it

### Haskell

``` sh
nix flake init -t "github:kayvank/flakes#cabal"
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
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#nix_basic
```
