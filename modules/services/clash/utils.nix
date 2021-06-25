{ pkgs, config }:

with pkgs.lib;
let
  cfg = config.indexyz.services.clash;
  managePort = last (splitString ":" cfg.controller);
  manageAddr = "http://127.0.0.1:${managePort}";
in
rec {
  inherit managePort manageAddr;
  updateConfigScript = name: enableUpdate: ''
    # Replace ports
    ${pkgs.yq-go}/bin/yq eval "del(.socks-port)" -i ${name}.yaml
    ${pkgs.yq-go}/bin/yq eval "del(.port)" -i ${name}.yaml
    ${pkgs.yq-go}/bin/yq eval ".mixed-port = ${toString cfg.port}" -i ${name}.yaml

    ${optionalString cfg.allowLan ''
    ${pkgs.yq-go}/bin/yq eval ".allow-lan = true" -i ${name}.yaml
    ''}

    ${pkgs.yq-go}/bin/yq eval ".dns.default-nameserver[0] = \"${cfg.dns}\"" -i ${name}.yaml

    # Format document
    ${pkgs.yq-go}/bin/yq eval ${name}.yaml -I 4 --prettyPrint -i

    ${optionalString ((name == cfg.config) && enableUpdate) ''
    ${pkgs.curl}/bin/curl ${manageAddr}/configs -X PUT \
        --data '{"path": "${cfg.dataDir}/${name}.yaml"}' ${optionalString (cfg.secret != null) "-H 'Authorization: Bearer ${cfg.secret}'"}
    ''}
  '';
}
