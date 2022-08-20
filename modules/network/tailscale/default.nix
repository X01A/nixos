{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.network.tailscale;
  port = config.services.tailscale.port;
  haveElement = it: (builtins.length it) > 0;
  optionalList = cond: list: if cond then list else [ ];

  tailscaleJoinArgsList = [
    "-authkey"
    "$(cat ${cfg.authFile})"
    "--login-server"
    cfg.loginServer
  ] ++ (optionalList (haveElement cfg.advertiseRoutes) [
    "--advertise-routes"
    (builtins.concatStringsSep "," cfg.advertiseRoutes)
  ]) ++ (optionalList (cfg.acceptRoute) [
    "--accept-routes=true"
  ]) ++ (optionalList (cfg.advertiseExitNode) [
    "--advertise-exit-node=true"
  ]) ++ cfg.extraUpArgs;

  enableForwarding = ((haveElement cfg.advertiseRoutes) || cfg.advertiseExitNode || cfg.derper.enable);

  tailscaleJoinArgsString = builtins.concatStringsSep " " tailscaleJoinArgsList;
in
{
  imports = [
    ./cert.nix
  ];

  options = {
    indexyz.network.tailscale = {
      enable = mkEnableOption "Enable tailscale client module";

      authFile = mkOption {
        type = types.str;
        example = "/run/keys/TAILSCALE_KEY";
        description = "File location store tailscale auth-key";
      };

      loginServer = mkOption {
        type = types.str;
        default = "https://controlplane.tailscale.com";
        example = "https://headscale.example.com";
        description = "Tailscale login server url";
      };

      advertiseRoutes = mkOption {
        type = with types; listOf str;
        default = [ ];
        example = ''["10.0.0.0/24"]'';
        description = "List of advertise routes";
      };

      acceptRoute = mkOption {
        type = types.bool;
        default = false;
        description = "Accept route when join netowrk";
      };

      advertiseExitNode = mkOption {
        type = types.bool;
        default = false;
      };

      insertTable = mkOption {
        type = types.bool;
        default = true;
      };

      extraUpArgs = mkOption {
        type = with types; listOf str;
        default = [ ];
        description = "Extra args for tailscale up";
      };

      derper = {
        enable = mkEnableOption "Enable tailscale derper service";

        domain = mkOption {
          type = types.str;
          default = "127.0.0.1";
          description = "Domain used to connect to derp";
        };

        port = mkOption {
          type = types.int;
          default = 443;
          description = "Derper forwarder listen port";
        };

        stunPort = mkOption {
          type = types.int;
          default = 3478;
          description = "Derper stun listen port";
        };

        certFile = mkOption {
          type = types.str;
          description = "Domain SSL cert file";
        };

        keyFile = mkOption {
          type = types.str;
          description = "Domain SSL key file";
        };
      };
    };
  };

  config = mkIf cfg.enable (mkMerge [
    ({
      # Default Tailscale ports should listen
      networking.firewall.allowedUDPPorts = [ 41641 ];
    })

    ({
      services.tailscale.enable = true;
      environment.systemPackages = with pkgs; [
        tailscale
      ];

      networking.firewall.allowedTCPPorts = mkIf (port > 0) [
        port
      ];

      networking.firewall.allowedUDPPorts = mkIf (port > 0) [
        port
      ];

      # Don't restart tailscale if changed, arovid ssh connection disconnect
      systemd.services.tailscaled.restartIfChanged = false;
      systemd.services.tailscale-autoconnect = {
        description = "Automatic connection to Tailscale";

        # make sure tailscale is running before trying to connect to tailscale
        after = [ "network-pre.target" "tailscale.service" ];
        wants = [ "network-pre.target" "tailscale.service" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig.Type = "oneshot";
        script = with pkgs; ''
          # wait for tailscaled to settle
          sleep 2

          # check if we are already authenticated to tailscale
          status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
          if [ $status = "Running" ]; then # if so, then do nothing
            exit 0
          fi

          ${tailscale}/bin/tailscale up ${tailscaleJoinArgsString}
        '';
      };
    })

    (mkIf (enableForwarding) {
      boot.kernel.sysctl = {
        "net.ipv4.conf.all.forwarding" = true;
        "net.ipv4.conf.default.forwarding" = true;
        "net.ipv4.ip_forward" = true;
        "net.ipv6.conf.all.forwarding" = true;
      };
    })

    (mkIf (enableForwarding && cfg.insertTable) {
      networking.nftables.ruleset = mkAfter ''
        table ip nat {
          chain postrouting {
            type nat hook postrouting priority srcnat; policy accept;
            iifname "tailscale0" masquerade
          }
        }
      '';
    })

    (mkIf (cfg.derper.enable) {
      networking.firewall.allowedTCPPorts = [ cfg.derper.port cfg.derper.stunPort ];
      networking.firewall.allowedUDPPorts = [ cfg.derper.stunPort ];
      systemd.services.derper = {
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];

        serviceConfig = {
          PermissionsStartOnly = true;
          Type = "simple";
          Restart = "always";

          LoadCredential = [
            "${cfg.derper.domain}.crt:${cfg.derper.certFile}"
            "${cfg.derper.domain}.key:${cfg.derper.keyFile}"
          ];
        };

        script = ''
          exec ${pkgs.derper}/bin/derper -verify-clients -certmode manual -hostname ${cfg.derper.domain} -certdir $CREDENTIALS_DIRECTORY \
            -a ":${builtins.toString cfg.derper.port}" -stun-port ${builtins.toString cfg.derper.stunPort}
        '';
      };
    })
  ]);
}
