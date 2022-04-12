{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-tKttNybW64LiADXInF2y8wWo2ayxk0iD6/IVzhprt8w=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "cmd/gost" ];

  doCheck = false;
}
