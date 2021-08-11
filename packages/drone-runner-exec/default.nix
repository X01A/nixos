{ source, buildGoModule, lib }:

buildGoModule rec {
  inherit (source) pname version src;

  vendorSha256 = "ypYuQKxRhRQGX1HtaWt6F6BD9vBpD8AJwx/4esLrJsw=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
