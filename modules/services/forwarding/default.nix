{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.forwarding;
  ruleOptions = types.submodule (import ./rule-options.nix {
    inherit lib;
  });

  ifThenElse = cond: t: f: if cond then t else f;

  typeToAttr = type: ifThenElse (type == "all")
    {
      use_udp = true;
    }
    (ifThenElse (type == "tcp")
      { }
      {
        use_udp = true;
        no_tcp = true;
      });

  generateConfig = conf: ({
    listen = "${conf.listen}:${toString conf.port}";
    remote = "${conf.target}:${toString conf.targetPort}";
  } // (typeToAttr conf.type));

  configData = {
    log = { level = cfg.logLevel; };
    endpoints = map generateConfig cfg.rules;
  };

  configFile = pkgs.writeText "config.json" (builtins.toJSON configData);
in
{
  options = {
    indexyz.services.forwarding = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      logLevel = mkOption {
        default = "info";
        type = types.enum [ "off" "error" "warn" "info" "debug" "trace" ];
      };

      rules = mkOption {
        default = [ ];
        type = types.listOf ruleOptions;
      };
    };
  };

  config = mkIf cfg.enable {

    systemd.services.realm = {
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
        ExecStart = "${pkgs.realm}/bin/realm -c ${configFile}";
        Restart = "on-failure";
      };
    };

    networking.firewall.allowedTCPPorts = (
      map (item: item.port)
        (filter (it: ((it.type == "tcp") || (it.type == "all"))) cfg.rules)
    );

    networking.firewall.allowedUDPPorts = (
      map (item: item.port)
        (filter (it: ((it.type == "udp") || (it.type == "all"))) cfg.rules)
    );
  };
}
