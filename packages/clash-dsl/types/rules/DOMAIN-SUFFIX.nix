{ lib }:

with lib;

types.submodule ({
  options = {
    domainSuffix = mkOption {
      type = types.str;
      example = "youtube.com";
      description = "routes any FQDN that ends with domain given";
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
    __toString = data: "DOMAIN-SUFFIX,${data.domainSuffix},${data.policy}";
  };
})
