{
  lib,
  config,
  pkgs,
  ...
}:

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
      user = { 
        email = "7685264+5aaee9@users.noreply.github.com";
        name = "Indexyz";
      };
      signing.format = "openpgp";
      settings = {
        credential = {
          "https://github.com" = {
            helper = "${pkgs.gh}/bin/gh auth git-credential";
          };
        };
      };
    };
  };
}
