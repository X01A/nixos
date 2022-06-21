{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-KcNp3VdJ201oxzF0bLXY4xWHqHNz54ZrVSI96cfhU+k=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
