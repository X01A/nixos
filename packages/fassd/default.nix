{ lib, fetchFromGitHub, buildGoModule, source }:

buildGoModule rec {
  inherit (source) pname version src;

  patches = [
    ./0000-dot-install-systemd-and-files.patch
  ];
  vendorSha256 = null;
  subPackages = [ "." ];

  doCheck = false;

  postInstall = ''
    cp docker-compose.yaml $out
    cp prometheus.yml $out
    cp resolv.conf $out
  '';
}
