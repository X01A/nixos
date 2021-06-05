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
  ];
}
