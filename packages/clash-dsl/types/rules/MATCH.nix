{ lib }:

with lib;

types.submodule ({
  options = {
    policy = mkOption {
      type = types.str;
      example = "DIRECT";
      description = "The rest of the packets to policy";
    };

    __toString = mkOption {
      readOnly = true;
      visible = false;
    };
  };

  config = {
    __toString = data: "MATCH,${data.policy}";
  };
})
