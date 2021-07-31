{ lib, fetchFromGitHub, buildGoModule, source, go-bindata }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "rO5wTFa0iVZYjkabJAipFeV/Yn/rHymsjnv1juWiOOw=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  preBuild = ''
    ${go-bindata}/bin/go-bindata -pkg wski18n -o wski18n/i18n_resources.go wski18n/resources
  '';

  doCheck = false;
}
