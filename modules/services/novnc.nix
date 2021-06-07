{ config, pkgs, lib, ... }:
with lib;
let
  vmCfg = config.zhaofeng.services.hypervisor;
  cfg = config.indexyz.services.novnc;

  portList = (builtins.filter (config: config.port != null)
    (lib.attrsets.mapAttrsToList
      (name: machine: (
        let
          basicio = (builtins.filter
            (
              (device: device.type == "basic-io")
            )
            machine.devices);
        in
        {
          name = name;
          port =
            if ((builtins.length basicio) > 0) then
              (builtins.head basicio).config.port
            else null;
        }
      ))
      vmCfg.machines));
in
{
  options = {
    indexyz.services.novnc = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable noVNC page
        '';
      };

      basicDomain = mkOption {
        type = types.str;
        example = "gaia.indexyz.me";
        description = ''
          Basic domain for novnc
        '';
      };

      users = mkOption {
        type = types.attrs;
        description = ''
          Users that can access the noVNC backend.
        '';
      };

      tls = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable TLS ACME encryption for novnc site
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      novnc
      pkgs.pythonPackages.websockify
    ];

    systemd.services = builtins.listToAttrs (map
      (item:
        let
          vncBase = "/run/hypervisor/vnc";
          vncSocket = "${vncBase}/${item.name}";
        in
        {
          name = "websockify-${item.name}";
          value = {
            description = "Websockify for machine ${item.name}";
            wantedBy = [ "multi-user.target" ];
            partOf = [ "vm-${item.name}-lifetime.service" ];

            serviceConfig = {
              ExecStart = "${pkgs.pythonPackages.websockify}/bin/websockify --unix ${vncSocket} 127.0.0.1:${toString item.port}";
              Restart = "always";
            };
          };
        })
      portList);

    services.nginx.virtualHosts = builtins.listToAttrs (map
      (item: {
        name = "${item.name}.${cfg.basicDomain}";
        value = {
          forceSSL = cfg.tls;
          enableACME = cfg.tls;
          root = pkgs.novnc;
          basicAuth = cfg.users;

          locations = {
            "/websockify" = {
              proxyWebsockets = true;
              proxyPass = "http://127.0.0.1:${toString item.port}";
              extraConfig = ''
                proxy_read_timeout 61s;
                proxy_buffering off;
              '';
            };

            "/" = {
              index = "vnc.html";
            };
          };
        };
      })
      portList);
    # environment.etc."io-port-list.json".text = (builtins.toJSON portList);
  };
}
