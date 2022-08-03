{ lib, fetchFromGitHub, buildGoModule, source, pkg-config }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-KtRQwrCBsOX7Jk9mKdDNOD7zfssADfBXCO1RPZbp5Aw=";

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
