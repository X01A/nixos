{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1fde59b76dacd15eaba882385e9f4d6afc790ce3";
    sha256 = "sha256-lInW3Alx7hNATLXUtCvcyyOR9f7XUAS/V9aYo5XNJgI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
