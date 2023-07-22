{ wrapFirefox, firefox-unwrapped }:

wrapFirefox firefox-unwrapped {
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

      # 1Password
      "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
      };
    };
  };
}
