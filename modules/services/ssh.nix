{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.ssh;
  keys = [
    # CI Deploy Keys
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBuNngR3JgkjC7I7g8/v4YQNH8Pu13bZcCl9q7Ho8hYJ"
    # Home NAS
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDHDfjdhKhsp76c/c3q9o8HHwFoZ5SjKi6jVEQp6B4Ty root@nixos"
    # Glowstone Laptop
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQChAHl9xXQPu0uF1kEoLLT/mpIdasbaTItnh3kQSk8X2G1Sf9MBnaDQhZ/VcCbehJNZ/tfai+ieUgm/fUtaefLiJwQXm0sx85YB2VroYBr2iSpxc8ia68PQ6+Ii784fAjLWADX4THOHexCYcIzDgVq1pTh/IR/8KVFfKiuhPqEYYUFbZ/oH2VuNKGtIso/leBgoUM/7Tgg+nKzMuv96PMlxzpTsQT9ogX3kTx8xAvKvJ/kyzemmZQoxw5dtcK7ojAOB8kPG0fybCz4EGJmFjyMzB4BtADeShCnUXcHoUcj3NXyp6DhAYfHg/L4s6yfKnZg4TPOdOuDnv5WNHGWzNQlEoCOu2cP9tjQmCtvFasLjQIBwuM1vjtYQY3FsMiMMHskIwGosSwF102ovylpASzIfsTldzWXoqOwUcMDC341SznY4WbejIX4WYKw/qt+CPXNZmQfpCVRuqHFihc2qPMiLqt/q4CrzplUupthWdXkzrP595Qzw/MYrQkCITTZ1Gts= indexyz@Glowstone"
  ];
in
{
  options = {
    indexyz.services.ssh = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      keys = mkOption {
        default = keys;
        type = with types; listOf str;
      };
    };
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      permitRootLogin = "prohibit-password";
      passwordAuthentication = false;
      forwardX11 = true;
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    users.users = {
      root.openssh.authorizedKeys.keys = cfg.keys;
      indexyz.openssh.authorizedKeys.keys = cfg.keys;
    };
  };

}
