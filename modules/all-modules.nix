{ ... }:

{
  imports = [
    ./environment/base.nix
    ./environment/qemu.nix
    ./environment/efi.nix
    ./services/ssh.nix
    ./services/clash
    ./services/teleport-agent.nix
    ./services/drone-web.nix
    ./services/drone-worker.nix
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
    ./devices/mlx4-mode.nix
  ];
}
