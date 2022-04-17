{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-594s/JRhK+n7ZupeUuNwqb05n3nUg0shAvKntFm2qYY=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "cmd/gost" ];

  doCheck = false;
}
