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
    ms-vsliveshare.vsliveshare
    matklad.rust-analyzer
    arrterian.nix-env-selector
  ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "indent-rainbow";
      publisher = "oderwat";
      version = "8.3.1";
      sha256 = "sha256-dOicya0B2sriTcDSdCyhtp0Mcx5b6TUaFKVb0YU3jUc=";
    }
    {
      name = "path-intellisense";
      publisher = "christian-kohler";
      version = "2.8.1";
      sha256 = "sha256-lTKzMphkGgOG2XWqz3TW2G9sISBc/kG7oXqcIH8l+Mg=";
    }
    {
      name = "direnv";
      publisher = "mkhl";
      version = "0.6.1";
      sha256 = "sha256-5/Tqpn/7byl+z2ATflgKV1+rhdqj+XMEZNbGwDmGwLQ=";
    }
    {
      name = "vscode-todo-highlight";
      publisher = "wayou";
      version = "1.0.5";
      sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
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
        # Workbench style
        "workbench.colorTheme" = "One Dark Pro";
        "workbench.iconTheme" = "material-icon-theme";

        # Git settings
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "git.ignoreLegacyWarning" = true;

        # Font settings
        "terminal.integrated.fontFamily" = "Iosevka, Cascadia Code PL";
        "editor.fontFamily" = "Iosevka, Cascadia Code PL";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;

        # Enable bracketPairColorization
        "editor.bracketPairColorization.enabled" = true;
      };
      inherit extensions;
    };
  };
}
