{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.indexyz.programs.nvim;
in
{
  options = {
    indexyz.programs.nvim.enable = mkOption {
      default = true;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile = {
      "nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };

    programs = {
      neovim = {
        enable = true;
        viAlias = true;

        plugins = with pkgs.vimPlugins; [
          # Nerd Tree
          nerdtree
          nerdtree-git-plugin

          # VIM Nix Auto fill
          vim-nix

          # Editor Config
          editorconfig-vim

          auto-pairs

          # Theme and color schema
          vim-airline
          vim-airline-clock
          dracula-vim

          # Indent with line
          indentLine
          vim-floaterm
        ];

        extraConfig = ''
          call index#init()
        '';
      };
    };
  };
}
