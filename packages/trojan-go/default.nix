{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-c6H/8/dmCWasFKVR15U/kty4AzQAqmiL/VLKrPtH+s4=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  tags = [ "full" ];

  doCheck = false;
}
