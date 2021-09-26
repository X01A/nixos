{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "6ilKBJveBtOjEU5vOdpexf592XMIIjNJwEq4OTyclgQ=";

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
