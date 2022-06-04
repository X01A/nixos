{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-tR/JYF4IF01fLbI2rZvAGnO2bfIaPlPij70U1DPjjJ0=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
