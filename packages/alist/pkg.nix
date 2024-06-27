{ stdenv, glibc, fetchFromGitHub, buildGoModule, fetchurl, lib }:

let
  version = "3.35.0";
  alist-web = fetchurl {
    url = "https://github.com/alist-org/alist-web/releases/download/${version}/dist.tar.gz";
    sha256 = "sha256-lAYIwrn2TPWFrU0kFUXl8eWeX25U746iycOimZgxP8c=";
  };
in
buildGoModule rec {
  pname = "alist";
  version = "3.35.0";

  src = fetchFromGitHub {
    owner = "alist-org";
    repo = "alist";
    rev = "v${version}";
    sha256 = "sha256-N9WgaPzc8cuDN7N0Ny3t6ARGla0lCluzF2Mut3Pg880=";
  };

  vendorHash = "sha256-lZIM1Cy3JmcrnxC+HN9Ni7P70yVR1LtHVKe3nOhA4fg=";

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
