{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-Atl8jY4h7d1K4lCemX/fwiS3Nc0w56LUPy8ZrdZrqxg=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
