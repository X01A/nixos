{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-lA4uW0cc0XqU9pjVEMapFLb3eD20Lea9PbkgL3sjJns=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "cmd/gost" ];

  doCheck = false;
}
