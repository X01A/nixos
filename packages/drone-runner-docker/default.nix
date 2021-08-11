{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "tQPM91jMH2/nJ2pq8ExS/dneeLNb/vcL9kmEjyNtl5Y=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
