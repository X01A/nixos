{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.base;
in
{
  options = {
    indexyz.environment.base = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      ntp = mkOption {
        default = true;
        type = types.bool;
      };

      wireguard = mkOption {
        default = true;
        type = types.bool;
      };

      ns = mkOption {
        default = true;
        type = types.bool;
      };

      podman = mkOption {
        default = true;
        type = types.bool;
      };

      tunaMirror = mkOption {
        default = false;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable (lib.mkMerge [
    (lib.mkIf (cfg.ntp) {
      networking.timeServers = [
        "ntp.aliyun.com"
        "ntp1.aliyun.com"
      ];

      services.ntp.enable = true;
    })
    (lib.mkIf (cfg.ns) {
      networking.nameservers = [ "1.1.1.1" ];
    })
    (lib.mkIf (cfg.tunaMirror) {
      nix.binaryCaches = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
    })
    (lib.mkIf (cfg.podman) {
      virtualisation.podman = {
        enable = true;
      };
      virtualisation.oci-containers.backend = "podman";
    })
    (lib.mkIf (cfg.wireguard) {
      boot.extraModulePackages =
        lib.optional (lib.versionOlder config.boot.kernelPackages.kernel.version "5.6")
          config.boot.kernelPackages.wireguard;
      boot.kernelModules = [ "wireguard" ];
    })
    {
      nix = {
        gc = {
          automatic = true;
          options = "--delete-older-than 7d";
        };
        # Enable nix flake support
        package = pkgs.nixUnstable;
        extraOptions = ''
          experimental-features = nix-command flakes
        '';
      };

      documentation.enable = false;
      boot.cleanTmpDir = true;

      networking.usePredictableInterfaceNames = false;

      time.timeZone = "Asia/Shanghai";

      i18n.defaultLocale = "en_US.UTF-8";
      nixpkgs.config.allowUnfree = true;
      boot.kernel.sysctl = {
        "net.ipv4.tcp_tw_recycle" = 1;
        "net.ipv4.tcp_tw_reuse" = 1;
        "net.ipv4.tcp_no_metrics_save" = 1;
        "net.ipv4.tcp_sack" = 1;
        "vm.overcommit_memory" = 1;
        "vm.swappiness" = 1;
        "net.core.default_qdisc" = "fq";
        "net.ipv4.tcp_ecn" = 1;
        "net.ipv4.tcp_congestion_control" = "bbr2";
      };
      environment.systemPackages = with pkgs; [
        wget
        file
        lsof
        go-pup
        gh
        git
        clash
        tmux
        neofetch
        htop
        nodejs
        yarn
        python2
        gnumake
        gcc
        binutils
        nload
        vim
        pciutils
        iotop
        btrfs-progs
        iperf
        iperf2
        bc
        ethtool
        ffsend
        tree
        killall
        nixpkgs-fmt
      ];
      programs.fish = {
        enable = true;
        shellInit = ''
          ${pkgs.starship}/bin/starship init fish | source
        '';
      };
      users = {
        mutableUsers = false;
        users.indexyz = {
          hashedPassword = "$6$PMi4RX.RMlh2M.l1$akzUwJf3qII5I/r/GQBKpAYZh5wewNkTCuasPSEiWiTZSdn7uunHXJJeY7742klZPm.zVsAg8fD91DY5DE5JS.";
          isNormalUser = true;
          home = "/home/indexyz";
          description = "Indexyz";
          extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd" "qemu-libvirtd" "kvm" ];
          shell = pkgs.fish;
        };
      };

      security.sudo.extraRules = [
        { users = [ "indexyz" ]; commands = [{ command = "ALL"; options = [ "NOPASSWD" ]; }]; }
      ];

      powerManagement.cpuFreqGovernor = "ondemand";
      users.users.root.shell = pkgs.fish;
      programs.fuse.userAllowOther = true;
    }
  ]);
}
