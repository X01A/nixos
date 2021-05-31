{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.indexyz.services.clash;
  managePort = last (splitString ":" cfg.controller);
  manageAddr = "http://127.0.0.1:${managePort}";
in
{
  config = mkIf cfg.enable {
    systemd.services = builtins.listToAttrs (map
      (item: {
        name = "clash-subscribe-${item.name}";
        value = {
          path = with pkgs; [ curl yq-go ];
          serviceConfig = {
            Type = "oneshot";
            User = "clash";
            Group = "clash";
            WorkingDirectory = cfg.dataDir;
          };
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ];

          script = ''
            curl -SL '${item.url}' -o ${item.name}.yaml

            # Replace ports
            yq eval "del(.socks-port)" -i ${item.name}.yaml
            yq eval "del(.port)" -i ${item.name}.yaml
            yq eval ".mixed-port = ${toString cfg.port}" -i ${item.name}.yaml

            ${optionalString cfg.allowLan ''
            yq eval ".allow-lan = true" -i ${item.name}.yaml
            ''}

            yq eval ".dns.default-nameserver[0] = \"${cfg.dns}\"" -i ${item.name}.yaml

            ${optionalString (item.name == cfg.config) ''
            curl ${manageAddr}/configs -X PUT \
                --data '{"path": "${cfg.dataDir}/${item.name}.yaml"}' ${optionalString (cfg.secret != null) "-H 'Authorization: Bearer ${cfg.secret}'"}
            ''}
          '';
        };
      })
      cfg.subscribe);

    systemd.timers = builtins.listToAttrs (map
      (item: {
        name = "clash-subscribe-${item.name}";
        value = {
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ];
          partOf = [ "clash-subscribe-${item.name}.service" ];
          timerConfig.OnCalendar = item.calendar;
        };
      })
      cfg.subscribe);
  };
}
