{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "00d6b5eaf01b084860d83cad982d9a5d8a9adcdb";
    sha256 = "sha256-5N8EKgN0dEy2TGgjShiYIYks+9YeV1E5N+FuE6e5D/E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
