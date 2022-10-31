{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.homebrew;
in
{
  options = {
    indexyz.environment.homebrew = {
      enable = mkEnableOption "Enable homebrew environment";
    };
  };

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;
      onActivation = {
        cleanup = "zap";
        autoUpdate = true;
      };

      taps = [
        "gromgit/fuse"
        "homebrew/cask-drivers"
        "homebrew/cask-fonts"
        "homebrew/cask"
      ];
      casks = [
        "yesplaymusic"
        "wine-stable"
        "vmware-fusion"
        "vivaldi"
        "visual-studio-code"
        "telegram-desktop"
        "telegram"
        "snipaste"
        "raspberry-pi-imager"
        "openinterminal"
        "obs"
        "mumble"
        "multimc"
        "motrix"
        "macfuse"
        "launchcontrol"
        "keyboardcleantool"
        "keka"
        "mattermost"
        "jetbrains-toolbox"
        "iterm2"
        "insomnia"
        "iina"
        "hiddenbar"
        "android-file-transfer"
        "android-platform-tools"
        "bitwarden"
        "chia"
        "clash-for-windows"
        "discord"
        "docker"
        "electronmail"
        "librewolf"
        "kicad"
        "steam"
        "parsec"
      ];
    };
  };
}
