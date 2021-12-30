{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.base;
in
{
  options = {
    indexyz.environment.base = {
      enable = mkEnableOption "Enable base environment";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnsupportedSystem = true;

    programs.fish = {
      enable = true;
    };

    environment.shells = [ pkgs.fish ];
    networking.knownNetworkServices = [ "Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge" ];

    nix = {
      package = pkgs.nixUnstable;
      useDaemon = true;
      useSandbox = true;

      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
      };

      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };

    environment.systemPackages = with pkgs; [
      neofetch
      gh
      starship
      tmux
      wget
      sshpass
      ansible
      htop
      ripgrep
      coreutils
      p7zip
      sshfs
      mas
      bat
    ];
  };
}
