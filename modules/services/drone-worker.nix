{ config, lib, pkgs, ... }:

with lib;
let
  podName = "drone-runner-pod";
  cfg = config.indexyz.services.drone-worker;
in
{
  options = {
    indexyz.services.drone-worker = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      name = mkOption {
        type = types.str;
      };

      capacity = mkOption {
        default = 2;
        type = types.int;
      };

      rpcProto = mkOption {
        default = "https";
        type = types.enum [ "http" "https" ];
      };

      rpcHost = mkOption {
        type = types.str;
      };

      rpcSecret = mkOption {
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {

    systemd.services.drone-runner-pod = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      before = [ "podman-drone-runner-dind.service" "podman-drone-runne.service" ];
      script = "${pkgs.podman}/bin/podman pod create --replace -n ${podName}";

      serviceConfig = {
        Type = "oneshot";
      };
    };

    virtualisation.oci-containers.containers.drone-runner-dind = {
      image = "docker:dind";
      extraOptions = [ "--pod=${podName}" "--privileged" ];
      entrypoint = "dockerd";
      cmd = [ "--host=tcp://0.0.0.0:2375" ];
    };

    virtualisation.oci-containers.containers.drone-runner = {
      image = "drone/drone-runner-docker:latest";
      extraOptions = [ "--pod=${podName}" ];

      environment = {
        DRONE_RPC_PROTO = cfg.rpcProto;
        DRONE_RPC_HOST = cfg.rpcHost;
        DRONE_RPC_SECRET = cfg.rpcSecret;
        DRONE_RUNNER_CAPACITY = "${toString cfg.capacity}";
        DRONE_RUNNER_NAME = cfg.name;
        DOCKER_HOST = "tcp://localhost:2375";
      };
    };

  };
}
