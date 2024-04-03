{ pkgs, config }:

with pkgs.lib;
let
  dataDir = "/var/lib/clash";
  cfg = config.indexyz.services.clash;
  managePort = last (splitString ":" cfg.controller);
  manageAddr = "http://127.0.0.1:${managePort}";
in
rec {
  inherit managePort manageAddr;
  updateConfigScript = name: enableUpdate:
    let
      fullName = "${dataDir}/${name}.yaml";
    in
    ''
      # Replace ports
      ${pkgs.yq-go}/bin/yq eval "del(.socks-port)" -i ${fullName}
      ${pkgs.yq-go}/bin/yq eval "del(.port)" -i ${fullName}
      ${pkgs.yq-go}/bin/yq eval ".mixed-port = ${toString cfg.port}" -i ${fullName}

      ${optionalString cfg.allowLan ''
      ${pkgs.yq-go}/bin/yq eval ".allow-lan = true" -i ${fullName}
      ''}

      ${optionalString (cfg.dns != "") ''
      ${pkgs.yq-go}/bin/yq eval "del(.dns.nameserver)" -i ${fullName}
      ${pkgs.yq-go}/bin/yq eval ".dns.enable = true" -i ${fullName}
      ${pkgs.yq-go}/bin/yq eval ".dns.nameserver[0] = \"${cfg.dns}\"" -i ${fullName}
      ''}

      # Format document
      ${pkgs.yq-go}/bin/yq eval ${fullName} -I 4 --prettyPrint -i

      ${optionalString ((name == cfg.config) && enableUpdate) ''
      ${pkgs.curl}/bin/curl ${manageAddr}/configs -X PUT \
          --data '{"path": "${fullName}"}' ${optionalString (cfg.secret != null) "-H 'Authorization: Bearer ${cfg.secret}'"}
      ''}
    '';
}
