{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.k3s;
in
{
  options = {
    indexyz.services.k3s = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };
    };
  };

  config = mkIf cfg.enable {
    services.k3s = {
      enable = true;
      role = "server";
      extraFlags = "--no-deploy traefik";
    };

    environment.variables.KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";

    # services.cgroups.enable = true;
    boot.kernelParams = [
      "cgroup_memory=1"
      "cgroup_enable=memory"
    ];

    environment.systemPackages = with pkgs; [
      k3s
      kubectl
      kubernetes-helm
    ];

    # https://github.com/NixOS/nixpkgs/issues/98766
    systemd.services.k3s.after = [
      "network-online.service"
      "firewall.service"
    ];
    systemd.services.k3s.serviceConfig.KillMode = lib.mkForce "control-group";

    boot.kernelModules = [
      "br_netfilter"
      "ip_conntrack"
      "ip_vs"
      "ip_vs_rr"
      "ip_vs_wrr"
      "ip_vs_sh"
      "overlay"
    ];
    networking.firewall.extraCommands = ''
      iptables -A INPUT -i cni+ -j ACCEPT
      iptables -I INPUT 1 -i cni0 -s 10.42.0.0/16 -j ACCEPT
      iptables -I FORWARD 1 -s 10.42.0.0/15 -j ACCEPT
    '';
  };
}
