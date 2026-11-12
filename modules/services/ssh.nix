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
    # herdr mobile
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP+ziAl91JBqlmQsizrQDIqqFk2p6LRcTySeDhYkYMYU herdr-mobile"
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

        # 暴力破解惩罚：认证失败 30s、无效用户/超时 1m，累计上限 1h
        PerSourcePenalties = "authfail:30s invaliduser:1m grace-exceeded:1m min:15s max:1h";
        # 回环豁免，避免本机自连/端口转发被误封
        PerSourcePenaltyExemptList = "127.0.0.0/8,::1/128";
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    users.users = {
      root.openssh.authorizedKeys.keys = cfg.keys;
      indexyz.openssh.authorizedKeys.keys = cfg.keys;
    };
  };

}
