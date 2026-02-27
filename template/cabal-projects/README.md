# What is this
A Cabal multi project

# Why do I need it
Start a cabal project with all required dependencies

# How do I use it
This is part of the flake template project.
To start your nix flake project:

+ If you have cloned the repository, point to the local flake as such:
``` sh
nix flake init -t ~/dev/q2io/nix/flakes#cabal-projects
```

+ Or, point to the github flake:

``` sh
nix flake init -t "github:kayvank/flakes#cabal-projects"
```


```sh
nix develop
cabal update && cabal build all && cabal test all
cabal exec $(cabal exec which project1)
cabal exec $(cabal exec which project2)
```

If you already have a `Haskell` environment, simply clone the project.

``` sh
cabal update && cabal build all && cabal test all
cabal exec $(cabal exec which project1)
cabal exec $(cabal exec which project2)
```
