# mshell

## development
```
nix develop ~/dev/mshell --command quickshell -c ~/dev/mshell
```
```
nix flake lock --update-input mshell
```
```
niri msg action spawn -- nix develop ~/dev/mshell --command qs -c ~/dev/mshell
```
