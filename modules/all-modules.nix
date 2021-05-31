{ ... }:

{
  imports = [
    ./environment/base.nix
    ./services/ssh.nix
    ./services/clash
    ./services/teleport-agent.nix
  ];
}
