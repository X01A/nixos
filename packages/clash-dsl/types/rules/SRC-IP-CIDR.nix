{ lib }:

with lib;

types.submodule ({
  options = {
    cidr = mkOption {
      type = types.str;
      example = "192.168.1.201/32";
      description = "routes any packets from 192.168.1.201/32 to the policy.";
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
    __toString = data: "SRC-IP-CIDR,${data.cidr},${data.policy}";
  };
})
