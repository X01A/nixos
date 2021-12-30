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

    # Fish config
    programs.fish = {
      enable = true;
    };

    environment.shells = [ pkgs.fish ];
    users.users.indexyz.shell = "/run/current-system/sw/bin/fish";

    # Networking config
    networking.knownNetworkServices = [ "Wi-Fi" "Bluetooth PAN" "Thunderbolt Bridge" ];

    # Nix config
    programs.nix-index.enable = true;
    services.nix-daemon.enable = true;

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
      nixpkgs-fmt
    ];
  };
}
