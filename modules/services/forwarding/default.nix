{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.forwarding;
  ruleOptions = types.submodule (import ./rule-options.nix {
    inherit lib;
  });
in
{
  options = {
    indexyz.services.forwarding = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      rules = mkOption {
        default = [ ];
        type = types.listOf ruleOptions;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services = builtins.listToAttrs (map
      (item:
        let
          socatName = if item.type == "tcp" then "TCP4" else "UDP";
        in
        {
          name = "forwarding-${item.type}-${toString item.port}";
          value = {
            wantedBy = [ "multi-user.target" ];
            after = [ "network.target" ];
            description = "Port forwarding for ${toString item.port} and type ${item.type}";
            serviceConfig = {
              ExecStart = "${pkgs.socat}/bin/socat ${socatName}-LISTEN:${toString item.port},reuseaddr,fork ${socatName}:${item.target}:${toString item.targetPort}";
              Restart = "always";
            };
          };
        })
      cfg.rules);

    networking.firewall.allowedTCPPorts = (
      map (item: item.port)
        (filter (it: it.type == "tcp") cfg.rules)
    );

    networking.firewall.allowedUDPPorts = (
      map (item: item.port)
        (filter (it: it.type == "udp") cfg.rules)
    );
  };
}
