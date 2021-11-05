{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "hwYmgGun9iYqXLih9aDIltsgxGWc/Ww9WJFwkRJsDpM=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
