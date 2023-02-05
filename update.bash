#!/usr/bin/env bash

nix-update --flake pufferpanel -vr "v(.*)"
nix-update --flake nali -vr "v(.*)"
nix-update --flake realm -vr "v(.*)"

nix-update --flake trojan-go
