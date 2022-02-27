{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.vscode;
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      # Editorconfig
      editorconfig.editorconfig
      # Formatter
      hookyqr.beautify
      # Git Plugins
      donjayamanne.githistory
      eamodio.gitlens
      # Golang
      golang.go

      spywhere.guides
      pkief.material-icon-theme
      zhuangtongfa.material-theme
      ryu1kn.partial-diff
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsc-community-material-theme";
        publisher = "Equinusocio";
        version = "1.4.4";
        sha256 = "sha256-Pn1IcgpwknVyKSnqs9/ZF2w6D2zASlAI6maPnvIltAA=";
      }
      {
        name = "indent-rainbow";
        publisher = "oderwat";
        version = "8.2.2";
        sha256 = "sha256-7kkJc+hhYaSKUbK4eYwOnLvae80sIg7rd0E4YyCXtPc=";
      }
      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.8.0";
        sha256 = "sha256-VPzy9o0DeYRkNwTGphC51vzBTNgQwqKg+t7MpGPLahM=";
      }
    ];
in
{
  options = {
    indexyz.programs.vscode.enable = mkOption {
      default = false;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      userSettings = {
        "workbench.colorTheme" = "Community Material Theme";
        "workbench.iconTheme" = "material-icon-theme";
      };
      inherit extensions;
    };
  };
}
