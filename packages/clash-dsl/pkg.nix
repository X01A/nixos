{ formats, lib }:

rec {
  types = import ./types { inherit lib formats; };
  combinators = import ./combinators.nix { inherit lib formats; };

  wapperRulesFile = rulesFile: (combinators.wapperRules (import rulesFile { inherit combinators; }));
}
