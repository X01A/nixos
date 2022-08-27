{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-171/Xx0wvJt4X3KdVZJG/D7BIiqdh0mB/AcQMmLA6/M=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." "netclient" ];

  doCheck = false;
}
