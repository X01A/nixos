{ nixpkgs, os, npmlock2nix }:

with nixpkgs; let
  nvfetcherOut = callPackage ../sources.nix { };
  build-electron-appimage = callPackage ./build-electron-appimage { };
  osPkgPath = ./. + "/os-specific/${os}";
  systemPackages = if builtins.pathExists osPkgPath then callPackage osPkgPath { inherit nixpkgs nvfetcherOut; } else { };
in
{
  inherit build-electron-appimage;

  transmission-web-control = callPackage ./transmission-web-control { };
  vlmcsd = callPackage ./vlmcsd { };
  speedtest = callPackage ./speedtest { };

  wgcf = callPackage ./wgcf {
    source = nvfetcherOut.wgcf;
  };

  yacd = callPackage ./yacd {
    source = nvfetcherOut.yacd;
  };

  hpool-chia-miner = callPackage ./hpool-chia-miner { };

  # Proxy things
  microsocks = callPackage ./microsocks {
    source = nvfetcherOut.microsocks;
  };
  leaf = callPackage ./leaf { };

  # Libvirt module

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix { };
  build-vm-qcow = callPackage ./build-vm-qcow { };

  # Clash
  clash-dsl = callPackage ./clash-dsl { };

  fcitx5-material-color = callPackage ./fcitx5-material-color {
    source = nvfetcherOut.fcitx5-material-color;
  };

  yesplaymusic = callPackage ./yesplaymusic {
    inherit build-electron-appimage;
    source = nvfetcherOut.yesplaymusic;
  };

  tifig = callPackage ./tifig {
    source = nvfetcherOut.tifig;
  };

  sunshine = callPackage ./sunshine {
    source = nvfetcherOut.sunshine;
  };

  cloudreve = callPackage ./cloudreve {
    source = nvfetcherOut.cloudreve;
  };

  openwhisk-cli = callPackage ./openwhisk-cli {
    source = nvfetcherOut.openwhisk-cli;
  };

  vpncloud = callPackage ./vpncloud {
    source = nvfetcherOut.vpncloud;
  };

  winbox = callPackage ./winbox {
    source = nvfetcherOut.winbox;
  };

  motrix = callPackage ./motrix {
    inherit build-electron-appimage;
    source = nvfetcherOut.motrix;
  };

  mmdb-ipip = callPackage ./mmdb-ipip {
    source = nvfetcherOut.mmdb-ipip;
  };

  drone-runner-exec = callPackage ./drone-runner-exec {
    source = nvfetcherOut.drone-runner-exec;
  };

  drone-runner-docker = callPackage ./drone-runner-docker {
    source = nvfetcherOut.drone-runner-docker;
  };

  nali = callPackage ./nali {
    source = nvfetcherOut.nali;
  };

  wiretrustee = callPackage ./wiretrustee {
    source = nvfetcherOut.wiretrustee;
  };

  novnc = callPackage ./novnc { };

  mattermost-ent = callPackage ./mattermost-ent {
    source = nvfetcherOut.mattermost;
  };

  vouch = callPackage ./vouch {
    source = nvfetcherOut.vouch;
  };

  gost-master = callPackage ./gost {
    source = nvfetcherOut.gost;
  };

  clash-premium = callPackage ./clash-premium {
    source = nvfetcherOut.clash-premium;
  };

  edl = callPackage ./edl {
    source = nvfetcherOut.edl;
  };

  tun2socks = callPackage ./tun2socks {
    source = nvfetcherOut.tun2socks;
  };

  teleport-ent = callPackage ./teleport-ent { };


  commit-notifier = callPackage ./commit-notifier {
    source = nvfetcherOut.commit-notifier;
  };

  nearcore = callPackage ./nearcore {
    source = nvfetcherOut.nearcore;
  };

  babel = callPackage ./babel { };

  simple-obfs = callPackage ./simple-obfs {
    source = nvfetcherOut.simple-obfs;
  };

  pufferpanel = callPackage ./pufferpanel {
    inherit npmlock2nix;
    source = nvfetcherOut.pufferpanel;
  };

  librefox-index = (wrapFirefox firefox-unwrapped {
    extraPolicies = {
      PasswordManagerEnabled = false;
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = {
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "network.trr.mode" = 3;
        "network.dns.echconfig.enabled" = true;
        "network.dns.http3_echconfig.enabled" = true;
        "network.dns.use_https_rr_as_altsvc" = true;
      };

      ExtensionSettings = {
        # Adguard
        "adguardadblocker@adguard.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
        };
        # Switchy Omega
        "switchyomega@feliscatus.addons.mozilla.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/switchyomega/latest.xpi";
        };
      };
    };
  });
} // systemPackages
