{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.zhaofeng.services.hypervisor;
  models = import ./models.nix { inherit lib; };
  tools = import ./tools { inherit pkgs config; };

  rawXml = pkgs.writeText "raw-machines.xml" (builtins.toXML tools.renderedMachines);
  renderedXml = pkgs.runCommand "vm-render-domains"
    {
      xslt = ./nix-to-libvirt.xsl;
    } ''
    mkdir -p $out
    cd $out
    ${pkgs.saxonb}/bin/saxonb ${rawXml} $xslt
  '';
in
{
  options = {
    zhaofeng.services.hypervisor = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Use this machine as a hypervisor
        '';
      };
      domainNamespace = mkOption {
        description = ''
          Namespace UUID for domain UUID generation
        '';
        type = types.str;
        example = "d58effd6-22b0-11eb-87d2-fbb5448a68fd";
      };
      macNamespace = mkOption {
        description = ''
          Namespace UUID for predictive MAC generation
        '';
        type = types.str;
        example = "509ee912-24b8-11eb-96f4-1b7af47272c3";
      };
      storagePath = mkOption {
        description = ''
          Path to persistent storage
        '';
        type = types.str;
        default = "/var/lib/hypervisor";
      };
      machines = mkOption {
        description = ''
          A set of VMs to run on the host
        '';
        type = types.attrsOf models.machineType;
        default = { };
      };
    };
  };

  imports = [
    ./fixes/remove-default-network.nix
  ];

  config = mkIf cfg.enable {
    # I actually did not know the real default in the
    # kernel is having them enabled...
    boot.kernel.sysctl = {
      "net.bridge.bridge-nf-call-arptables" = 0;
      "net.bridge.bridge-nf-call-iptables" = 0;
      "net.bridge.bridge-nf-call-ip6tables" = 0;
    };

    virtualisation.libvirtd = {
      enable = true;
      qemuOvmf = true;
    };

    systemd.tmpfiles.rules = [
      "d /run/libvirt/vnc 0750 root root -"
    ];

    environment.etc."hypervisor".source = renderedXml;
    # For each VM, we set up two services:
    # vm-<name>-lifetime.service
    # vm-<name>-reload-domain.service
    systemd.services = builtins.listToAttrs (lib.lists.flatten (lib.attrsets.mapAttrsToList
      (name: val:
        let
          provisionScripts = builtins.concatStringsSep "\n" (map (rd: rd.provisionScript) val.renderedDevices);
        in
        [
          {
            name = "vm-${name}-lifetime";
            value = {
              restartIfChanged = false;
              wantedBy = [ "multi-user.target" ];
              wants = [ "vm-${name}-reload-domain.service" ];
              serviceConfig = {
                Type = "oneshot";
                RemainAfterExit = "yes";
                ExecStop = pkgs.writeScript "vm-undefine-${name}" ''
                  #!${pkgs.runtimeShell} -e
                  ${pkgs.libvirt}/bin/virsh destroy ${name}
                  ${pkgs.libvirt}/bin/virsh undefine ${val.uuid}
                '';
              };
            };
          }
          {
            name = "vm-${name}-reload-domain";
            value = {
              restartIfChanged = true;
              wantedBy = [ "multi-user.target" ];
              partOf = [ "vm-${name}-lifetime.service" ];
              serviceConfig = {
                Type = "oneshot";
                RemainAfterExit = "no";
                ExecStart = pkgs.writeScript "vm-define-${name}" ''
                  #!${pkgs.runtimeShell} -e

                  cur=/run/hypervisor/current-configs
                  dom=/etc/hypervisor/domain_${name}.xml
                  checksum=$cur/domain_${name}.checksum
                  check=${pkgs.coreutils}/bin/sha1sum

                  ${pkgs.coreutils}/bin/mkdir -p $cur
                  if [ ! -f $checksum ] || ! $check -c $checksum; then
                    echo "Domain changed. Reloading..."

                    # Run provision scripts
                    ${provisionScripts}

                    # Reload domain definition
                    ${pkgs.libvirt}/bin/virsh define $dom
                    $check $dom > $checksum

                    # Maybe auto-start the domain?
                    if [ ! -z "${toString val.autoStart}" ]; then
                      ${pkgs.libvirt}/bin/virsh destroy ${name} || true
                      ${pkgs.libvirt}/bin/virsh start ${name} || true
                    fi
                  else
                    echo "Domain unchanged."
                  fi
                '';
              };
            };
            restartTriggers = [
              rawXml
            ];
          }
        ])
      tools.renderedMachines));

    #environment.etc."provisioner-test.txt".text = builtins.toJSON (lib.attrsets.mapAttrsToList (machineName: machine:
    #  (builtins.map (v: provisioners.getConfig v machineName machine) machine.volumes)
    #) cfg.machines);
  };
}
