{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.base;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fishPlugins.z
      fishPlugins.pisces
      fishPlugins.fzf-fish
    ];


    programs.fish = {
      shellInit = ''
        set -gx STARSHIP_CONFIG /etc/starship.toml

        ${pkgs.starship}/bin/starship init fish | source
      '';
    };


    environment.etc."starship.toml".text = ''
      add_newline = false

      format = """
      [](#9A348E)\
      $os\
      $username\
      [](bg:#DA627D fg:#9A348E)\
      $directory\
      [](fg:#DA627D bg:#FCA17D)\
      $git_branch\
      $git_status\
      [](fg:#FCA17D bg:#86BBD8)\
      $c\
      $elixir\
      $elm\
      $golang\
      $gradle\
      $haskell\
      $java\
      $julia\
      $nodejs\
      $nim\
      $rust\
      $scala\
      [](fg:#86BBD8 bg:#06969A)\
      $docker_context\
      [](fg:#06969A bg:#33658A)\
      $time\
      [ ](fg:#33658A)\
      """

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      [username]
      show_always = true
      style_user = "bg:#9A348E"
      style_root = "bg:#9A348E"
      format = '[$user ]($style)'
      disabled = false

      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      [os]
      style = "bg:#9A348E"
      disabled = true # Disabled by default

      [directory]
      style = "bg:#DA627D"
      format = "[ $path ]($style)"
      truncation_length = 3
      truncation_symbol = "…/"

      # Here is how you can shorten some long paths by text replacement
      # similar to mapped_locations in Oh My Posh:
      [directory.substitutions]
      "Documents" = "󰈙 "
      "Downloads" = " "
      "Music" = " "
      "Pictures" = " "
      # Keep in mind that the order matters. For example:
      # "Important Documents" = " 󰈙 "
      # will not be replaced, because "Documents" was already substituted before.
      # So either put "Important Documents" before "Documents" or use the substituted version:
      # "Important 󰈙 " = " 󰈙 "

      [c]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [docker_context]
      symbol = " "
      style = "bg:#06969A"
      format = '[ $symbol $context ]($style) $path'

      [elixir]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [elm]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [git_branch]
      symbol = ""
      style = "bg:#FCA17D"
      format = '[ $symbol $branch ]($style)'

      [git_status]
      style = "bg:#FCA17D"
      format = '[$all_status$ahead_behind ]($style)'

      [golang]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [gradle]
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [haskell]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [java]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [julia]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [nodejs]
      symbol = ""
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [nim]
      symbol = "󰆥 "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [rust]
      symbol = ""
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [scala]
      symbol = " "
      style = "bg:#86BBD8"
      format = '[ $symbol ($version) ]($style)'

      [time]
      disabled = false
      time_format = "%R" # Hour:Minute Format
      style = "bg:#33658A"
      format = '[ ♥ $time ]($style)'
    '';
  };
}
