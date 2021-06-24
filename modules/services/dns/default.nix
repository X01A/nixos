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
        ExecStart = "${pkgs.dnsproxy}/bin/dnsproxy ${dnsProxy} -p ${toString cfg.proxyPort}";
        Restart = "on-failure";
      };
    };
  };
}