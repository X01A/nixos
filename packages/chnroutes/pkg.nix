{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4b7c1efb3fb5cfb70a2001c9d066b072a0d30058";
    sha256 = "sha256-pGWNgBvg2+9biNhosTY6U3s7e1lOZD5VN5SQQha5Czo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
