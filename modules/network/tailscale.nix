{ pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.network.tailscale;
in
{
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
    };
  };

  config = mkIf cfg.enable {
    services.tailscale.enable = true;
    environment.systemPackages = with pkgs; [
      tailscale
    ];
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

        ${tailscale}/bin/tailscale up -authkey $(cat ${cfg.authFile}) \
            --login-server ${cfg.loginServer}
      '';
    };
  };
}
