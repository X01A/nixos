{ lib }:

with lib;

types.submodule ({
  options = {
    port = mkOption {
      type = types.int;
      example = "80";
      description = "routes any packets from the port 80 to policy";
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
    __toString = data: "SRC-PORT,${toString data.port},${data.policy}";
  };
})

