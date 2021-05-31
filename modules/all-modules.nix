{ ... }:

{
  imports = [
    ./environment/base.nix
    ./services/ssh.nix
    ./services/clash
  ];
}
