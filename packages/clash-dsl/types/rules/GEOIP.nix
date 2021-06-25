{ lib }:

with lib;

types.submodule ({
  options = {
    country = mkOption {
      type = types.str;
      example = "CN";
      description = "routes any requests to a China IP address to policy";
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
    __toString = data: "GEOIP,${data.country},${data.policy}";
  };
})

