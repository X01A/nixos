{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.indexyz.services.clash;
  utils = import ./utils.nix { inherit pkgs config; };
  inherit (utils) managePort manageAddr;
in
{
  config = mkIf cfg.enable {
    systemd.services = builtins.listToAttrs (map
      (item: {
        name = "clash-subscribe-${item.name}";
        value = {
          serviceConfig = {
            Type = "oneshot";
            WorkingDirectory = cfg.dataDir;
          };
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ];

          script = ''
            ${pkgs.curl}/bin/curl -SL '${item.url}' -o ${item.name}.yaml

            ${utils.updateConfigScript item.name true}
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
