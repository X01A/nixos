{ lib }:

with lib;

types.submodule ({
  options = {
    domainKeyword = mkOption {
      type = types.str;
      example = "google";
      description = " routes any FQDN that contains domain given";
    };

    policy = mkOption {
      type = types.str;
      example = "DIRECT";
      description = "Domain policy";
    };

    __toString = mkOption {
      readOnly = true;
      visible = false;
    };
  };

  config = {
    __toString = data: "DOMAIN-KEYWORD,${data.domainKeyword},${data.policy}";
  };
})
