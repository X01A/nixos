{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6fb973c226c44f79d52b8d4279fcbe75db4581f6";
    sha256 = "sha256-aD/vdJrESled0QaIAw++uFQnWg5u8oqn+Lc8UWTVGxc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
