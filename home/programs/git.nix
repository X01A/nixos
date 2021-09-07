{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.git;
in
{
  options = {
    indexyz.programs.git.enable = mkOption {
      default = true;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userEmail = "jiduye@gmail.com";
      userName = "Indexyz";

      extraConfig = {
        credential = {
          "https://github.com" = {
            helper = "${pkgs.gh}/bin/gh auth git-credential";
          };
        };
      };
    };
  };
}
