{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-AfD5d0KDnVIEo4glf1IqTT33XvXbnMILhCbyslUdZiQ=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." "netclient" ];

  doCheck = false;
}
