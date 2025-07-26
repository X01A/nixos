{ stdenv, glibc, fetchFromGitHub, buildGoModule, fetchurl, lib }:

let
  version = "3.46.0";
  alist-web = fetchurl {
    url = "https://github.com/alist-org/alist-web/releases/download/${version}/dist.tar.gz";
    sha256 = "sha256-Nwm+xZu8FPD590GTzruyWjF8l4+jpa4GqQDrNB4bWuc=";
  };
in
buildGoModule rec {
  pname = "alist";
  inherit version;

  src = fetchFromGitHub {
    owner = "alist-org";
    repo = "alist";
    rev = "v${version}";
    sha256 = "sha256-wvEt/qEA6Eb6aSf3yX6xYzSG3jaIggPNfZPK+wD4eTA=";
  };

  vendorHash = "sha256-7NSc2MubhoGtuSp5aSQMJO1N1jrSYWScxOvni1BhIr0=";

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
