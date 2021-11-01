{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "XnD2hYQA+Zs4yuOrIh+nDDDk1JNeWS8vK22538/L7Cs=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "cmd/gost" ];

  doCheck = false;
}
