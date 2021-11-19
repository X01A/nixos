{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-I5wyHTlmBa6CZ11YE98S7eRcJkR0Ng6zxP6mSv2Azo8=";

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
