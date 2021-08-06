{ lib }:

with lib;

let
  clashTypes = import ./types { inherit lib; };

  evalProfile = data: (
    (evalModules {
      modules = [
        {
          options = {
            profile = mkOption {
              type = clashTypes.profile;
              description = "Clash Profile";
            };
          };
        }
        {
          profile = data;
        }
      ];
    }).config.profile
  );

  evalRule = ruleType: data: builtins.toString (
    (evalModules {
      modules = [
        {
          options = {
            rule = mkOption {
              type = ruleType;
              description = "Rule data";
            };
          };
        }
        {
          rule = data;
        }
      ];
    }).config.rule
  );

  evalProxy = proxyType: data: (
    (evalModules {
      modules = [
        {
          options = {
            proxy = mkOption {
              type = proxyType;
              description = "Proxy data";
            };
          };
        }
        {
          proxy = data;
        }
      ];
    }).config.proxy
  );
in
{
  inherit evalProfile;

  buildText = cfg: builtins.toString (evalProfile cfg);

  # Domain Based
  domain = domain: policy: evalRule clashTypes.rules.DOMAIN ({ inherit domain policy; });
  domainSuffix = domainSuffix: policy: evalRule clashTypes.rules.DOMAIN-SUFFIX ({ inherit domainSuffix policy; });
  domainKeyword = domainKeyword: policy: evalRule clashTypes.rules.DOMAIN-KEYWORD ({ inherit domainKeyword policy; });

  # IP Based
  geoip = country: policy: evalRule clashTypes.rules.GEOIP ({ inherit country policy; });
  ipCidr = cidr: policy: evalRule clashTypes.rules.IP-CIDR ({ inherit cidr policy; });
  ipCidr6 = cidr: policy: evalRule clashTypes.rules.IP-CIDR6 ({ inherit cidr policy; });
  srcCidr = cidr: policy: evalRule clashTypes.rules.SRC-IP-CIDR ({ inherit cidr policy; });

  srcPort = port: policy: evalRule clashTypes.rules.SRC-PORT ({ inherit port policy; });
  dstPort = port: policy: evalRule clashTypes.rules.DST-PORT ({ inherit port policy; });

  processName = process: policy: evalRule clashTypes.rules.PROCESS-NAME ({ inherit process policy; });

  match = policy: evalRule clashTypes.rules.MATCH ({ inherit policy; });

  direct = "DIRECT";
  reject = "REJECT";

  wapperRules = rules: policy: (map (it: it policy) rules);
}
