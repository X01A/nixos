#!/usr/bin/env bash

nix-update --commit --flake nali
nix-update --commit --flake realm
nix-update --commit --flake trojan-go
