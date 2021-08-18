{ lib, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "S98vBzu/cGhu0NdgTHWnVfckQi7WrJ5ACmbyNVnDU0w=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
