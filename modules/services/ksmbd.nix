{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.ksmbd;

  user = types.submodule ({
    options = {
      user = mkOption {
        type = types.str;
      };
      pass = mkOption {
        type = types.str;
      };
    };
  });

  userCommand = user: pass: ''
    ${pkgs.ksmbd-tools}/bin/ksmbd.adduser -i $out -a ${user} -p ${pass}
  '';

  smbToString = x: if builtins.typeOf x == "bool" then boolToString x else toString x;

  shareConfig =
    name:
    let
      share = getAttr name cfg.shares;
    in
    "[${name}]\n "
    + (smbToString (map (key: "${key} = ${smbToString (getAttr key share)}\n") (attrNames share)));

  usersFile = pkgs.runCommand "ksmbd-users" { } (
    builtins.concatStringsSep "\n" (map (it: userCommand it.user it.pass) cfg.users)
  );
  configFile = pkgs.writeText "ksmbd.conf" ''
    [global]
    security = ${cfg.securityType}
    ${cfg.extraConfig}

    ${smbToString (map shareConfig (attrNames cfg.shares))}
  '';
in
{
  options = {
    indexyz.services.ksmbd = {
      enable = mkEnableOption "Enable cifsd kernel server";

      securityType = mkOption {
        type = types.str;
        default = "user";
        description = "Samba security type";
      };

      extraConfig = mkOption {
        type = types.lines;
        default = "";
        description = ''
          Additional global section and extra section lines go in here.
        '';
        example = ''
          guest account = nobody
          map to guest = bad user
        '';
      };

      shares = mkOption {
        default = { };
        description = ''
          A set describing shared resources.
          See <command>man smb.conf</command> for options.
        '';
        type = types.attrsOf (types.attrsOf types.unspecified);
        example = literalExample ''
          { public =
            { path = "/srv/public";
              "read only" = true;
              browseable = "yes";
              "guest ok" = "yes";
              comment = "Public samba share.";
            };
          }
        '';
      };

      users = mkOption {
        default = [ ];
        type = with types; listOf user;
      };
    };
  };
  config = mkIf cfg.enable {
    boot = {
      extraModulePackages = [ pkgs.ksmbd-kernel ];
      kernelModules = [ "ksmbd" ];
    };
    environment.systemPackages = [ pkgs.ksmbd-tools ];

    systemd.services.ksmbd = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      preStart = ''
        mkdir -p /etc/ksmbd
        rm -f /etc/ksmbd/ksmbd.conf
        ln -s ${configFile} /etc/ksmbd/ksmbd.conf
      '';
      serviceConfig = {
        Type = "forking";
        ExecStart = "${pkgs.ksmbd-tools}/bin/ksmbd.mountd --users ${usersFile} --config /etc/ksmbd/ksmbd.conf -s";
        Restart = "always";
        PrivateTmp = true;
      };
    };
  };
}
