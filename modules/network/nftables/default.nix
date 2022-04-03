{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.indexyz.network.firewall;
  networkCfg = config.networking.firewall;

  mapToPortRange = it: "${builtins.toString it.from}-${builtins.toString it.to}";
  haveElement = it: (builtins.length it) > 0;

  buildElemet = it: optionalString (haveElement it) "elements = { ${builtins.concatStringsSep ", " it} }";

  allowTcpPorts = (map builtins.toString networkCfg.allowedTCPPorts) ++ (map mapToPortRange networkCfg.allowedTCPPortRanges);
  allowUdpPorts = (map builtins.toString networkCfg.allowedUDPPorts) ++ (map mapToPortRange networkCfg.allowedUDPPortRanges);
in
{
  options = {
    indexyz.network.firewall = {
      enable = mkEnableOption "Enable custom nftables firewall";

      blacklist = mkOption {
        # https://support.censys.io/hc/en-us/articles/360043177092-Opt-Out-of-Scanning
        default = [ "162.142.125.0/24" "167.94.138.0/24" "167.94.145.0/24" "167.94.146.0/24" "167.248.133.0/24" ];
        type = with types; listOf str;
      };
    };
  };

  config = mkIf cfg.enable {
    networking.firewall.enable = false;

    networking.nftables = {
      enable = true;
      ruleset = ''
        table inet filter {
          set allow_tcp {
            type inet_service
            flags interval
            ${buildElemet allowTcpPorts}
          }

          set allow_udp {
            type inet_service
            flags interval
            ${buildElemet allowUdpPorts}
          }

          set blacklist {
            type ipv4_addr
            flags interval
            ${buildElemet cfg.blacklist}
          }

          chain input {
            type filter hook input priority 0;
            iifname lo accept
            ct state { established, related } accept
            counter ip saddr @blacklist drop
            tcp dport @allow_tcp accept
            udp dport @allow_udp accept
            counter drop
          }

          chain output {
            type filter hook output priority 0;
            accept
          }
        }
      '';
    };
  };
}
