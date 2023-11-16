{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e2954579514543de19e39f133e3912562c357beb";
    sha256 = "sha256-apFwGvu9/G2K1viBf9VRKj1jORmjqe9ClFr3OPnSOXw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
