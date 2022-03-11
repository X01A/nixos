{ lib, fetchFromGitHub, buildGo117Module, source }:

buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-6nhR0lXHD+pVFNkWNH4b0/TvT0yr1mgedx1S3Wwhb88=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "client" "management" "signal" ];

  doCheck = false;

  # Rename bin/client to bin/wiretrustee
  fixupPhase = ''
    cd $out/bin
    mv client wiretrustee
    mv management wiretrustee-mgmt
    mv signal wiretrustee-signal
  '';
}
