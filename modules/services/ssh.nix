{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.ssh;
  keys = [
    # Main Key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBuNngR3JgkjC7I7g8/v4YQNH8Pu13bZcCl9q7Ho8hYJ"
    # Yubi Key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAIJLnuQitwR6Y/5EAJ+wih8p+3QHPfwiiaci93xhoAq"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJg/HHwlBxt2/Io+4M5j6Qwwi8IMTYe8XoDijkfTXHoE"
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
        PermitRootLogin = "prohibit-password";
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
