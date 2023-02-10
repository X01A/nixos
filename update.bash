#!/usr/bin/env bash

nix-update --commit --flake nali
nix-update --commit --flake realm
nix-update --commit --flake trojan-go
nix-update --commit --flake fcitx5-material-color
nix-update --commit --flake microsocks
nix-update --commit --flake vpncloud
nix-update --commit --flake tun2socks
nix-update --commit --flake hev-socks5-tproxy
nix-update --commit --flake novnc
nix-update --commit --flake landrop --url https://github.com/LANDrop/LANDrop

nix-update --commit --version branch --flake simple-obfs
nix-update --commit --version branch --flake edl
nix-update --commit --version branch --flake commit-notifier
nix-update --commit --version branch=release --flake mmdb-ipip
nix-update --commit --version branch=master --flake miui-auto-task

