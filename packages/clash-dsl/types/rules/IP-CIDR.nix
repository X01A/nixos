{ lib }:

with lib;

types.submodule ({
  options = {
    cidr = mkOption {
      type = types.str;
      example = "127.0.0.0/8";
      description = "routes any packets to 127.0.0.0/8 to the policy.";
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
    __toString = data: "IP-CIDR,${data.cidr},${data.policy}";
  };
})

