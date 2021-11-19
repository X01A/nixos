{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-E18ykjQc1eoHpviYok+NiLaeH01UMQmigl9JDwtR+zo=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
