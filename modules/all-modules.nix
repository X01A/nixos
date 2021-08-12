{ ... }:

{
  imports = [
    ./environment/base.nix
    ./environment/qemu.nix
    ./environment/efi.nix
    ./environment/acme
    ./services/ssh.nix
    ./services/clash
    ./services/teleport-agent.nix
    ./services/drone-web.nix
    ./services/drone-docker.nix
    ./services/frpc
    ./services/frps
    ./services/k3s.nix
    ./services/transmission.nix
    ./services/libvirt
    ./services/atftpd.nix
    ./services/novnc.nix
    ./services/leaf.nix
    ./services/dhcp
    ./services/dns
    ./services/forwarding
    ./services/hpool-miner.nix
    ./services/prometheus.nix
    ./services/vlmcsd.nix
    ./services/ksmbd.nix
    ./services/cloudreve.nix
    ./services/vouch.nix
    ./services/nginx.nix
    ./services/argo.nix
    ./services/drone-exec.nix
    ./services/vpncloud.nix
    ./devices/mlx4-mode.nix
    ./desktops/font.nix
  ];
}
