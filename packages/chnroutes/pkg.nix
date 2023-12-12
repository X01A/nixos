{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b0dd91475d43fb5f64220f7c232143e53c43da04";
    sha256 = "sha256-CYgIWkPqxAwfpO57O9d/v45gf80NlOkYEud1Cdml1Rw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
