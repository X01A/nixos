{ lib }:

{
  inherit (import ./profile.nix { inherit lib; }) profile;
  inherit (import ./proxy.nix { inherit lib; }) proxyProvider buildProxyProvider proxyGroup buildProxyGroup;

  proxy = import ./proxy { inherit lib; };
  rules = import ./rules { inherit lib; };
}
