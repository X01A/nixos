#!/usr/bin/env bash

set -ex

function fetch-github-release {
  VERSION=$(curl --fail -s https://api.github.com/repos/"$1"/releases/latest | jq -r ".tag_name")
  if [ "$VERSION" = "" ]; then
    exit 1
  fi

  echo $VERSION
}

nix-update --commit --flake realm
nix-update --commit --flake trojan-go
nix-update --commit --flake fcitx5-material-color
nix-update --commit --flake microsocks
nix-update --commit --flake vpncloud
nix-update --commit --flake tun2socks
nix-update --commit --flake hev-socks5-tproxy
nix-update --commit --flake novnc
nix-update --commit --flake alist
nix-update --commit --flake landrop --url https://github.com/LANDrop/LANDrop

nix-update --commit --flake yacd
nix-update --commit --flake cloudreve
nix-update --commit --flake cockpit-machines
nix-update --commit --flake libvirt-dbus
nix-update --commit --flake mainsail
nix-update --commit --flake reader
nix-update --commit --flake mumble-discord-bridge
nix-update --commit --flake aliyundrive-webdav

nix-update --commit --version "$(curl --fail -sI 'https://mikrotik.com/mt_redirect.php?code=winbox64' | grep -i Location | grep -oP '([\d]{1,}\.[\d]{1,})')" --flake winbox
nix-update --commit --version "$(curl --fail -s 'https://mattermost.com/download/' | grep -oP "Latest Release:</strong> \K([0-9\\.]*)(?=</p>)")" --flake mattermost-ent
