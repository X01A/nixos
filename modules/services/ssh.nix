{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.ssh;
  keys = [
    # Main Key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBuNngR3JgkjC7I7g8/v4YQNH8Pu13bZcCl9q7Ho8hYJ"
    # Yubi Key
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIJ2VGrmjVBgF8cim47K/iDAG5nqKonLEseUzCEc0jhbYAAAABHNzaDo= indexyz-yubikey-fido"
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
