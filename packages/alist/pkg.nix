{ stdenv, glibc, fetchFromGitHub, buildGoModule, fetchurl, lib }:

let
  version = "3.45.0";
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
    sha256 = "sha256-4Ov0niOhP+T9EKq8bts/JudNPiqgyYGeCvGE5Q+dL/Q=";
  };

  vendorHash = "sha256-PZ06iN+J3k8of1oXQp3kT3YOi4cZzKzOXVH2q/kKR0o=";

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
