{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "0ai5vzlm7l1q4mn4dqc6ixiv22wsc4bi1g60v8qawmaiwdgx448h";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
