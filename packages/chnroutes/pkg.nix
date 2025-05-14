{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b9efc95cba951ff6c834eee15923ee0bd3764532";
    sha256 = "sha256-7Tl/QlKs/DO2AxxdwfKoF2VOl9rqLTag4eH44eW8gxA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
