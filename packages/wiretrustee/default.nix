{ lib, fetchFromGitHub, buildGo117Module, source }:

buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-yyfT4WcU/4iV5kbKk9V/HbHTXfzM1hgo0IPV//iEW4o=";

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
