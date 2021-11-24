{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-t3zuhyFS1ZWTbECm40CfhZPBHLpkBn2ausMjx1IHQb0=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
