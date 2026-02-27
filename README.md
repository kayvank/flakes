flakes
====
Collection of nix flake templates

## What is this
`nix develop` shell for 
- Haskell, single of multi project
- Rust
- LaTeX
- Nix
- JavaScript, deno+typescript

## How do I use it

### Haskell
+ Multi project:

``` sh
nix flake init -t "github:kayvank/flakes#cabal-projects"
git init && git add flake.nix cabal.project ./src 
nix develop 
cabal update && cabal build all && cabal testall
```

+ single cabal project:

``` sh
nix flake init -t "github:kayvank/flakes#cabal-project"
git init && git add ./cabal-project.cabal flake.nix
nix develop 
cabal update && cabal build && cabal test
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
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#cabal-projects
## cabal single project
nix flake init -t  ~/dev/workspaces/q2io/nix/workbook/flakes#cabal-project
```
