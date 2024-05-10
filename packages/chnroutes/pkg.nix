{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bc5218598c2406071460a9f3e5cf804ddb0ee43d";
    sha256 = "sha256-v8dCL1OMc9zDZW9Ny5Kcw0W9+uyRU627SSsrlyXb5tw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
