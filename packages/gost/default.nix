{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-K9tMR0ZdVFf1M1ISrzNksExpcrYvng0+zXWWwPqJp0o=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "cmd/gost" ];

  doCheck = false;
}
