#!/usr/bin/env bash

function fetch-github-release {
  curl -s https://api.github.com/repos/"$1"/releases/latest | jq -r ".tag_name"
}

nix-update --commit --flake nali
nix-update --commit --flake realm
nix-update --commit --flake trojan-go
nix-update --commit --flake fcitx5-material-color
nix-update --commit --flake microsocks
nix-update --commit --flake vpncloud
nix-update --commit --flake tun2socks
nix-update --commit --flake hev-socks5-tproxy
nix-update --commit --flake novnc
nix-update --commit --flake sunshine
nix-update --commit --flake landrop --url https://github.com/LANDrop/LANDrop

nix-update --commit --version "$(fetch-github-release haishanh/yacd)" --flake yacd
nix-update --commit --version "$(fetch-github-release cloudreve/Cloudreve)" --flake cloudreve

nix-update --commit --version branch --flake simple-obfs
nix-update --commit --version branch --flake edl
nix-update --commit --version branch --flake commit-notifier
nix-update --commit --version branch=release --flake mmdb-ipip
nix-update --commit --version branch=master --flake miui-auto-task
nix-update --commit --version branch --flake ksmbd-kernel
nix-update --commit --version branch --flake ksmbd-tools

nix-update --commit --version "$(curl -sI 'https://mikrotik.com/mt_redirect.php?code=winbox64' | grep Location | grep -oP '([\d]{1,}\.[\d]{1,})')" --flake winbox
nix-update --commit --version "$(curl -s 'https://github.com/Dreamacro/clash/releases/tag/premium' | grep -oP "Premium \K([0-9\\.]*)" | head -n 1)" --flake clash-premium
nix-update --commit --version "$(curl -s 'https://mattermost.com/deploy/' | grep -oP "mattermost-\K(.*)(?=-linux-amd64.tar.gz)" | head -n 1)" --flake mattermost-ent
