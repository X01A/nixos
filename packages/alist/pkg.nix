{ stdenv, glibc, fetchFromGitHub, buildGoModule, fetchurl, lib }:

let
  version = "3.43.0";
  alist-web = fetchurl {
    url = "https://github.com/alist-org/alist-web/releases/download/${version}/dist.tar.gz";
    sha256 = "sha256-aF3RO02jniUwhdgv0RB08FGxy8QCOEeUIXY7PS5JsvA=";
  };
in
buildGoModule rec {
  pname = "alist";
  inherit version;

  src = fetchFromGitHub {
    owner = "alist-org";
    repo = "alist";
    rev = "v${version}";
    sha256 = "sha256-H48LKi9AFyqxLzeu4DTavYsMlkQt4EUBbYZnzjMOleo=";
  };

  vendorHash = "sha256-ItH8vRCvIlcCnGWt0ApYkgH6v5UJ6ldJSm0Ii3ak6KI=";

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
