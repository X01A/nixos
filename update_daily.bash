#!/usr/bin/env bash

nix-update --commit --version branch --flake simple-obfs
nix-update --commit --version branch --flake edl
nix-update --commit --version branch --flake commit-notifier
nix-update --commit --version branch=release --flake mmdb-ipip
nix-update --commit --version branch --flake ksmbd-kernel
nix-update --commit --version branch --flake ksmbd-tools
nix-update --commit --version branch=gh-pages --flake yacd-meta
nix-update --commit --version branch --flake quickjspp
nix-update --commit --version branch --flake rapidjson
nix-update --commit --version branch --flake libcron
nix-update --commit --version branch=Alpha --flake clash-meta
