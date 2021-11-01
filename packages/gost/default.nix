{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = lib.fakeSha256;

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
