{ lib }:

with lib;

types.submodule ({
  options = {
    domain = mkOption {
      type = types.str;
      example = "www.google.com";
      description = "Route which domain to policy";
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
    __toString = data: "DOMAIN,${data.domain},${data.policy}";
  };
})

