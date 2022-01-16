{ pkgs, config, lib, nodes ? null, ... }:

with lib;
let
  cfg = config.indexyz.network.wireguard;
  getPublicKey = privateKey: (pkgs.readFile (
    pkgs.runCommandLocal "wireguard-public-key"
      {
        path = with pkgs; [ wireguard coreutils ];
      } ''
      echo ${privateKey} | wg pubkey | head -c 1 > $out
    ''
  ));

  publicKey = getPublicKey cfg.privateKey;
in
{
  options = {
    indexyz.network.wireguard = {
      enable = mkEnableOption "Enable mesh wireguard service";

      port = mkOption {
        description = "WireGuard port that this server listening";
        default = 54321;
        type = types.int;
      };

      privateKey = mkOption {
        description = "WireGuard passkey";
        type = types.str;
      };

      name = mkOption {
        default = "wireguard";
        description = "WireGuard interface name";
        type = types.str;
      };

      internal = mkOption {
        description = "WireGuard internal ip address";
        type = types.str;
      };

      targetAddress = mkOption
        {
          description = "WireGuard incoming connection address";
          default = config.deployment.targetHost;
          type = types.str;
        };
    };
  };

  config = mkIf cfg.enable {
    assertions = singleton {
      assertion = (nodes != null);
      message = ''
        evalModules not provide nodes
        Please use colmena https://github.com/zhaofengli/colmena to deploy or disable wireguard module
      '';
    };


  };

  meta.buildDocsInSandbox = false;
}
