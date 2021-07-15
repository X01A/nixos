{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "mLOOue+iZqH9eimTzezkySmDVV6Ac/9i3BhJhPkFJg0=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
