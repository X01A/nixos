{ lib, config, pkgs, ... }:

with lib;

let
  cfg = config.indexyz.secrets;
  secretsOptions = types.submodule ({
    options = {
      name = mkOption {
        type = types.str;
        description = "Secrets name";
      };

      kv = mkOption {
        type = types.str;
        description = "Which kv that secrets storage";
      };

      field = mkOption {
        type = types.str;
        description = "Secrets in kv field";
      };

      user = mkOption {
        type = types.str;
        description = "Key owner user";
        default = "root";
      };

      group = mkOption {
        type = types.str;
        description = "Key owner group";
        default = "root";
      };

      labels = mkOption {
        type = with types; listOf str;
        default = [ ];
        description = "Key label";
      };
    };
  });

  hasLabel = label: builtins.elem label cfg.hostLabels;
  deploymentKeys = filter (data: (any hasLabel data.labels)) cfg.availableSecrets;

  deplotmenyKeyToRealKey = data: {
    name = data.name;
    value = {
      inherit (data) user group;
      keyCommand = [ "vault" "kv" "get" "-field=${data.field}" data.kv ];
    };
  };

  placeHolder = {
    name = "KEY_MANAGEMENT_PLACEHOLDER";
    value = {
      keyCommand = [ "echo" "1" ];
    };
  };
in
{
  options = {
    indexyz.secrets = {
      enable = mkEnableOption "Enable secrets management";

      hostLabels = mkOption {
        type = with types; listOf str;
        default = [ "default" ];
      };

      availableSecrets = mkOption {
        type = with types; listOf secretsOptions;
        default = [ ];
      };
    };
  };

  config = mkIf cfg.enable {
    deployment.keys =  builtins.listToAttrs (
      lib.lists.flatten (map deplotmenyKeyToRealKey deploymentKeys) ++ [placeHolder]);

    systemd.services.key-activate = {
      description = "Waiting for deploy keys";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      unitConfig.DefaultDependencies = false;
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        while ! [ -e /run/keys/KEY_MANAGEMENT_PLACEHOLDER ]; do
          sleep 0.1
        done

        systemctl start keys.target
      '';
    };
  };
}
