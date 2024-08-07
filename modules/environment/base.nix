{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.base;
in
{
  options = {
    indexyz.environment.base = {
      enable = mkEnableOption "Enable base environment";

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

      direnv = mkOption {
        default = true;
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

      services.timesyncd.enable = true;
    })
    (lib.mkIf (cfg.direnv) {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
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
    (lib.mkIf (pkgs.system == "x86_64-linux") {
      environment.systemPackages = with pkgs; [
        i7z
      ];
    })
    {
      nix = {
        gc = {
          automatic = true;
          options = "--delete-older-than 7d";
        };
        # Enable nix flake support
        package = pkgs.nixVersions.latest;
        extraOptions = ''
          experimental-features = nix-command flakes configurable-impure-env
        '';
      };

      boot.kernelModules = [ "xfs" "tcp_bbr" ];

      # disable default dnssec
      # ntp domain reslove will failure if time not match
      # if ntp reslove failure time will never correct
      services.resolved.dnssec = lib.mkDefault "false";

      boot.tmp.cleanOnBoot = true;

      networking.usePredictableInterfaceNames = false;

      time.timeZone = "Asia/Shanghai";

      i18n.defaultLocale = "en_US.UTF-8";
      nixpkgs.config.allowUnfree = true;
      boot.kernel.sysctl = {
        # Disable magic SysRq key
        "kernel.sysrq" = lib.mkDefault 0;
        # Ignore ICMP broadcasts to avoid participating in Smurf attacks
        "net.ipv4.icmp_echo_ignore_broadcasts" = lib.mkDefault 1;
        # Ignore bad ICMP errors
        "net.ipv4.icmp_ignore_bogus_error_responses" = lib.mkDefault 1;
        # Reverse-path filter for spoof protection
        "net.ipv4.conf.default.rp_filter" = lib.mkDefault 1;
        "net.ipv4.conf.all.rp_filter" = lib.mkDefault 1;
        # SYN flood protection
        "net.ipv4.tcp_syncookies" = lib.mkDefault 1;
        # Do not accept ICMP redirects (prevent MITM attacks)
        "net.ipv4.conf.all.accept_redirects" = lib.mkDefault 0;
        "net.ipv4.conf.default.accept_redirects" = lib.mkDefault 0;
        "net.ipv4.conf.all.secure_redirects" = lib.mkDefault 0;
        "net.ipv4.conf.default.secure_redirects" = lib.mkDefault 0;
        "net.ipv6.conf.all.accept_redirects" = lib.mkDefault 0;
        "net.ipv6.conf.default.accept_redirects" = lib.mkDefault 0;
        # Protect against tcp time-wait assassination hazards
        "net.ipv4.tcp_rfc1337" = lib.mkDefault 1;
        # TCP Fast Open (TFO)
        "net.ipv4.tcp_fastopen" = lib.mkDefault 3;
        ## Bufferbloat mitigations
        # Requires >= 4.9 & kernel module
        "net.ipv4.tcp_congestion_control" = lib.mkDefault "bbr";
        # Requires >= 4.19
        "net.core.default_qdisc" = lib.mkDefault "cake";

        "net.ipv4.tcp_tw_recycle" = lib.mkDefault 1;
        "net.ipv4.tcp_tw_reuse" = lib.mkDefault 1;
        "net.ipv4.tcp_no_metrics_save" = lib.mkDefault 1;
        "net.ipv4.tcp_sack" = lib.mkDefault 1;
        "vm.overcommit_memory" = lib.mkDefault 1;
        "vm.swappiness" = lib.mkDefault 1;
        "net.ipv4.tcp_ecn" = lib.mkDefault 1;
      };


      programs.tmux = {
        aggressiveResize = true;
        clock24 = true;
        enable = true;
        newSession = true;
        reverseSplit = false;
        extraConfig = ''
          set -g mouse on
        '';
        plugins = with pkgs.tmuxPlugins; [
          prefix-highlight
          nord
        ];
      };

      programs.htop = {
        enable = true;
        settings = {
          hide_userland_threads = 1;
          show_program_path = 0;
        };
      };

      environment.systemPackages = with pkgs; [
        wget
        file
        lsof
        gh
        git
        fastfetch
        nodejs
        yarn
        gnumake
        gcc
        binutils
        nload
        pciutils
        usbutils
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
        inxi
        dig
        unzip
        openssl
        ncdu
        smartmontools
        nali
        xfsprogs
        pv
        jq
        wireguard-tools
        ripgrep
        eza
        fd
        zellij
        borgbackup
        dogdns
        fzf
        bat
        btop
      ];

      programs.fish = {
        enable = true;
        shellAliases = {
          ls = "eza";
          find = "fd";
          neofetch = "fastfetch";
          dh = "df -x squashfs -x overlay -x tmpfs -h";
        };
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

      services.fail2ban = {
        enable = true;
        maxretry = 5;
        ignoreIP = [
          "127.0.0.0/8"
          "10.0.0.0/8"
          "172.16.0.0/12"
          "192.168.0.0/16"
        ];
      };
    }
  ]);
}
