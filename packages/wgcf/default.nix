{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "l1hM+/585tbMvJppzB0zTtc0SQiZTSTxGkX+Os6xzso=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
