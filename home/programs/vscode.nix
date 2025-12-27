{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.indexyz.programs.vscode;

  mkOpenVSXExt =
    {
      publisher,
      name,
      version,
      sha256,
    }:
    {
      inherit name publisher version;
      vsix = builtins.fetchurl {
        inherit sha256;
        url = "https://open-vsx.org/api/${publisher}/${name}/${version}/file/${publisher}.${name}-${version}.vsix";
        name = "${publisher}-${name}.zip";
      };
    };

  extensions =
    (with pkgs.vscode-extensions; [
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
      rust-lang.rust-analyzer
      arrterian.nix-env-selector
      oderwat.indent-rainbow
      christian-kohler.path-intellisense
      mkhl.direnv
      jnoortheen.nix-ide
      vue.volar
      github.copilot
      github.copilot-chat
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      (mkOpenVSXExt {
        publisher = "jeanp413";
        name = "open-remote-ssh";
        version = "0.0.39";
        sha256 = "1bps29zbs0xy7b2p3q5xmva1lh6ma3gz6wzvr96d9ihcpgcrnni5";
      })

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
    indexyz.programs.vscode = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };
    };
  };

  config = mkIf cfg.enable {
    home.file.".vscode-oss/argv.json" = {
      force = true;
      text = builtins.toJSON {
        enable-crash-reporter = false;
        crash-reporter-id = "cde0befe-53e9-4442-9e17-8097c8d0e060";
        enable-proposed-api = [
          "jeanp413.open-remote-ssh"
        ];
      };
    };

    programs.vscode = {
      enable = true;
      package = (
        pkgs.vscodium.override {
          commandLineArgs = builtins.concatStringsSep " " [
            "--enable-wayland-ime"
            "--ozone-platform-hint=auto"
          ];
        }
      );

      profiles.default = {
        inherit extensions;
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
          "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font, Iosevka, Cascadia Code PL";
          "editor.fontFamily" = "CaskaydiaCove Nerd Font, Iosevka, Cascadia Code PL";
          "editor.fontLigatures" = true;
          "editor.fontSize" = 14;

          # Enable bracketPairColorization
          "editor.bracketPairColorization.enabled" = true;
        };
      };
    };
  };
}
