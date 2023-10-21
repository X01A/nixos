{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.ssh;
  keys = [
    # Main Key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBuNngR3JgkjC7I7g8/v4YQNH8Pu13bZcCl9q7Ho8hYJ"
    # Yubi Key
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCbas83Z0SQR/dCvBGZSuKaKD9l48tkaxIV54TjZ5ZB7T3LGf3OE1WLvYj9McJem0v2Ik50jhMBUO6b+kLm7jd8="
  ];
in
{
  options = {
    indexyz.services.ssh = {
      enable = mkEnableOption "Enable ssh config override";

      keys = mkOption {
        default = keys;
        type = with types; listOf str;
      };
    };
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;

      settings = {
        X11Forwarding = true;
        PermitRootLogin = lib.mkDefault "prohibit-password";
        PasswordAuthentication = false;
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    users.users = {
      root.openssh.authorizedKeys.keys = cfg.keys;
      indexyz.openssh.authorizedKeys.keys = cfg.keys;
    };
  };

}
