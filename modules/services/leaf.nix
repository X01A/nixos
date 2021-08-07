{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.indexyz.services.leaf;

  tunCfg = pkgs.writeText "leaf.conf" ''
    [General]
    loglevel = debug
    dns-server = ${builtins.concatStringsSep ", " cfg.dnsServer}
    dns-interface = ${cfg.address}
    always-fake-ip = *
    tun = ${cfg.tunName}, ${cfg.tunAddress}, ${cfg.tunNetmask}, ${cfg.tunGateway}, 1500

    [Proxy]
    Proxy = socks, ${cfg.socksHost}, ${toString cfg.socksPort}, interface=${cfg.address}
    Direct = direct, interface=${cfg.address}

    [Rule]
    FINAL, Proxy
  '';
in
{
  options = {
    indexyz.services.leaf = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      address = mkOption {
        type = types.str;
      };

      gateway = mkOption {
        default = config.networking.defaultGateway;
        type = types.str;
      };

      dnsServer = mkOption {
        default = config.networking.nameservers;
        type = with types; listOf str;
      };

      tunName = mkOption {
        default = "tun8";
        type = types.str;
      };

      tunGateway = mkOption {
        default = "172.16.0.1";
        type = types.str;
      };

      tunAddress = mkOption {
        default = "172.16.0.2";
        type = types.str;
      };

      tunNetmask = mkOption {
        default = "255.255.255.0";
        type = types.str;
      };

      socksHost = mkOption {
        type = types.str;
      };

      socksPort = mkOption {
        type = types.int;
      };
    };
  };

  config = mkIf cfg.enable {
    boot.kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv4.conf.default.forwarding" = true;
      "net.ipv4.ip_forward" = true;
    };

    systemd.services.leaf = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        PermissionsStartOnly = true;
        Type = "simple";
        ExecStart = ''${pkgs.leaf}/bin/leaf -c ${tunCfg}'';
        CapabilityBoundingSet = "CAP_NET_ADMIN";
        LimitNOFILE = "16777216";
        LimitNPROC = "infinity";
        LimitCORE = "infinity";
        TasksMax = "infinity";
        Restart = "always";
        RestartSec = 30;
      };

      postStart = ''
        # Sleep for tun device up
        sleep 2
        # Route traffic from other deivces to TUN.
        ${pkgs.iptables}/bin/iptables -I FORWARD -o ${cfg.tunName} -j ACCEPT

        # Route traffic initiated from leaf to the original gateway.
        ${pkgs.iproute2}/bin/ip route add default via ${cfg.gateway} table default
        ${pkgs.iproute2}/bin/ip rule add from ${cfg.address} table default

        # Route local traffic to TUN.
        ${pkgs.iproute2}/bin/ip route del default table main
        ${pkgs.iproute2}/bin/ip route add default via ${cfg.tunGateway}
      '';

      postStop = ''
        # Remove iptables rules.
        ${pkgs.iptables}/bin/iptables -D FORWARD -o ${cfg.tunName} -j ACCEPT

        # Cleanup the routing table.
        ${pkgs.iproute2}/bin/ip rule del from ${cfg.address}
        ${pkgs.iproute2}/bin/ip route del default table default

        # Recover the original default route.
        ${pkgs.iproute2}/bin/ip route add default via ${cfg.gateway}
      '';
    };
  };
}

