{ ... }:

{
  imports = [
    ./environment/base.nix
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
    ./services/forwarding
    ./services/hpool-miner.nix
    ./services/prometheus.nix
  ];
}
