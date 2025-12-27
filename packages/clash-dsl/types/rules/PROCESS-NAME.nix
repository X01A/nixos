{ lib }:

with lib;

types.submodule ({
  options = {
    process = mkOption {
      type = types.str;
      example = "nc";
      description = "routes the process nc to policy.";
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
    __toString = data: "PROCESS-NAME,${data.process},${data.policy}";
  };
})
