{ lib }:

with lib;

types.submodule ({
  options = {
    cidr = mkOption {
      type = types.str;
      example = "2620:0:2d0:200::7/32";
      description = "routes any packets to 2620:0:2d0:200::7/32 to the policy.";
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
    __toString = data: "IP-CIDR6,${data.cidr},${data.policy}";
  };
})
