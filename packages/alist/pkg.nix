{ stdenv, glibc, fetchFromGitHub, buildGoModule, fetchurl, lib }:

let
  version = "3.42.0";
  alist-web = fetchurl {
    url = "https://github.com/alist-org/alist-web/releases/download/${version}/dist.tar.gz";
    sha256 = "sha256-uZfT7PkvRHzB2sqbGum53D8oRFWJ2z3AVBdOzBWmAKk=";
  };
in
buildGoModule rec {
  pname = "alist";
  inherit version;

  src = fetchFromGitHub {
    owner = "alist-org";
    repo = "alist";
    rev = "v${version}";
    sha256 = "sha256-r9hL4bxeCiJKHiWMyN4MxqDeN3NhlY8pnpxBCaWDz9c=";
  };

  vendorHash = "sha256-HhJYp9yIHwhV5kjqeGLWbb+lGp7Sh2bq8DNWRwSx2Bg=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/alist-org/alist/v3/internal/conf.Version=v${version}"
    "-X github.com/alist-org/alist/v3/internal/conf.WebVersion=v${version}"
  ];

  postPatch = ''
    tar zxvf ${alist-web}
    rm -rf public/dist
    mv dist public/
  '';

  tags = [
    "jsoniter"
  ];

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  meta = {
    mainProgram = "alist";
  };
}
