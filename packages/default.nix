{ nixpkgs, os, npmlock2nix, flakeInputs }:

with nixpkgs.lib;
with nixpkgs; let
  nvfetcherOut = callPackage ../sources.nix { };
  build-electron-appimage = callPackage ./build-electron-appimage { };
  osPkgPath = ./. + "/os-specific/${os}";
  systemPackages = if builtins.pathExists osPkgPath then callPackage osPkgPath { inherit nixpkgs nvfetcherOut; } else { };

  dirOnly = it: if it.value == "directory" then true else false;
  hasPkgFile = dir: it: let
    itDir = builtins.readDir ("${dir}/${it.name}");
  in attrsets.hasAttrByPath [ "pkg.nix" ] itDir && itDir."pkg.nix" == "regular";

  scanPackages = dir:
    builtins.listToAttrs (
      map (it: { name = it.name; value = callPackage "${dir}/${it.name}/pkg.nix" {}; })
        (filter (hasPkgFile dir)
          (filter dirOnly
            (attrsets.mapAttrsToList (name: value: { inherit name value; }) (builtins.readDir dir)))));
in
{
  inherit build-electron-appimage;

  yacd = callPackage ./yacd {
    source = nvfetcherOut.yacd;
  };

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix { };
  build-vm-qcow = callPackage ./build-vm-qcow { };

  yesplaymusic = callPackage ./yesplaymusic {
    inherit build-electron-appimage;
    source = nvfetcherOut.yesplaymusic;
  };

  sunshine = callPackage ./sunshine {
    source = nvfetcherOut.sunshine;
  };

  cloudreve = callPackage ./cloudreve {
    source = nvfetcherOut.cloudreve;
  };

  winbox = callPackage ./winbox {
    source = nvfetcherOut.winbox;
  };

  motrix = callPackage ./motrix {
    inherit build-electron-appimage;
    source = nvfetcherOut.motrix;
  };

  mattermost-ent = callPackage ./mattermost-ent {
    source = nvfetcherOut.mattermost;
  };

  clash-premium = callPackage ./clash-premium {
    source = nvfetcherOut.clash-premium;
  };
  # pufferpanel = callPackage ./pufferpanel {
  #   inherit npmlock2nix;
  # };

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

        # Mode to use when receiving pan gesture input.
        # Fix wired left / right swipe on touchpad
        # https://hg.mozilla.org/mozilla-central/file/tip/modules/libpref/init/StaticPrefList.yaml#l562
        "apz.gtk.pangesture.delta_mode" = 2;
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
        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
        # MetaMask
        "webextension@metamask.io" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
        };
        # Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        };
        # User-Agent Switcher and Manager
        "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
        };
        # HTTPS Everywhere
        "https-everywhere@eff.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/https-everywhere/latest.xpi";
        };
        # Tabby
        "tabby@whatsyouridea.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabby-window-tab-manager/latest.xpi";
        };
      };
    };
  });
  # miui-auto-task = callPackage ./miui-auto-task/pkg.nix { };
} // systemPackages // (scanPackages "${flakeInputs.self.outPath}/packages")
