{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.dns;

  createProxyUpstream = server: "-u ${server}";
  dnsProxy = concatStringsSep " " (map createProxyUpstream cfg.upstreams);
in
{
  options = {
    indexyz.services.dns = {
      enable = mkEnableOption "DNS Server";

      openFirewall = mkOption {
        default = true;
        type = types.bool;
      };

      upstreams = mkOption {
        default = [ ];
        example = ''
          8.8.8.8:53
          tls://dns.adguard.com
          https://dns.adguard.com/dns-query
        '';
        type = with types; listOf str;
      };

      proxyPort = mkOption {
        default = 5553;
        description = "DNS port for dnsproxy which forwarding upstream dns";
        type = types.int;
      };

      dnsPort = mkOption {
        default = 53;
        description = "Final dns expose port";
        type = types.int;
      };

      proxyArgs = mkOption {
        default = "";
        description = "dnsproxy extra args";
        type = types.str;
      };

      extraConf = mkOption {
        default = "";
        description = "Extra config for coredns zoon";
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = singleton {
      assertion = (length cfg.upstreams) > 0;
      message = ''
        indexyz.services.dns should have upstream dns exist
      '';
    };

    systemd.services.dnsproxy = {
      description = "Dnsproxy dns server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        PermissionsStartOnly = true;
        LimitNPROC = 512;
        LimitNOFILE = 1048576;
        CapabilityBoundingSet = "cap_net_bind_service";
        AmbientCapabilities = "cap_net_bind_service";
        NoNewPrivileges = true;
        DynamicUser = true;
        ExecStart = "${pkgs.dnsproxy}/bin/dnsproxy ${dnsProxy} -p ${toString cfg.proxyPort} ${cfg.proxyArgs}";
        Restart = "on-failure";
      };
    };

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ cfg.dnsPort ];
      allowedUDPPorts = [ cfg.dnsPort ];
    };

    # TODO: add coredns rules
    services.coredns = {
      enable = true;
      config = ''
        .:${toString cfg.dnsPort} {
          errors
          log
          health
          ${cfg.extraConf}
          forward . 127.0.0.1:${toString cfg.proxyPort}
          cache {
            success 3600
            denial 0
          }
        }
      '';
    };
  };
}
