{ lib }:

{
  types = import ./types { inherit lib; };
  combinators = import ./combinators.nix { inherit lib; };
}
