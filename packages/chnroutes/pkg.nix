{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f900715eaa1fae3fed21e5a17528b964b5128d12";
    sha256 = "sha256-q59UHoqhfNCdVNRwiyVNiNiwmK/OE/kNpfVGLEvG2Wc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
