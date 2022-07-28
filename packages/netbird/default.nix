{ lib, fetchFromGitHub, buildGoModule, source, pkg-config }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-yyfT4WcU/4iV5kbKk9V/HbHTXfzM1hgo0IPV//iEW4o=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "client" "management" "signal" ];
  nativeBuildInputs = [ pkg-config ];

  doCheck = false;

  fixupPhase = ''
    cd $out/bin
    mv client netbird
    mv management netbird-mgmt
    mv signal netbird-signal
  '';
}
