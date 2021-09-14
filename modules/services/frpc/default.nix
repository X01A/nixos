{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.frpc;
  certs = config.security.acme.certs;
  serverOptions = types.submodule (import ./server-options.nix {
    inherit lib;
  });

  tunnelConfig = item: ''
    [${item.name}]
    type = ${item.type}

    ${optionalString (item.type != "https") ''
    local_ip = ${item.host}
    local_port = ${toString item.port}
    ''}

    ${optionalString (item.type == "tcp" || item.type == "udp") ''
    remote_port = ${toString item.remotePort}
    ''}
    ${optionalString (item.type == "http" || item.type == "https") ''
    custom_domains = ${item.domain}
    ''}

    ${optionalString (item.type == "https") ''
    plugin = https2http
    plugin_local_addr = ${item.host}:${toString item.port}
    ''}

    ${optionalString (item.type == "https" || item.acme) ''
    plugin_crt_path = ${certs.${item.domain}.directory}/fullchain.pem
    plugin_key_path = ${certs.${item.domain}.directory}/key.pem
    ''}
  '';

  generateAfter = server: map
    (item: "acme-finished-${item.domain}.target")
    (filter (item: item.acme) server.rules);

  basicConfig = server: ''
    [common]
    server_addr = ${server.server}
    server_port = ${toString server.serverPort}
    token = ${server.token}
  '';


  cfgFile = server: pkgs.writeText "frpc-${server.name}.ini" ''
    ${basicConfig server}

    ${concatStringsSep "\n" (map tunnelConfig server.rules)}
  '';

  acmeHosts = map
    (item: item.domain)
    (filter (item: item.type == "https" || item.acme) (lib.lists.flatten (map (item: item.rules) cfg.servers)));
in
{
  options = {
    indexyz.services.frpc = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      servers = mkOption {
        default = [ ];
        type = types.listOf serverOptions;
      };
    };
  };

  config = mkIf cfg.enable {
    # TODO: request cert sign if host type https

    systemd.services = builtins.listToAttrs (map
      (item: {
        name = "frpc-${item.name}";
        value = {
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ] ++ (generateAfter item);

          startLimitIntervalSec = 0;
          serviceConfig = {
            ExecStart = "${pkgs.frp}/bin/frpc -c ${cfgFile item}";
            Restart = "always";
            RestartSec = "10s";
          };
        };
      })
      cfg.servers);

    environment.etc."hosts.json".text = builtins.toJSON acmeHosts;
  };
}
