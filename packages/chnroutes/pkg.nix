{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "10aad510ce000d28566809ebe2bb12e6e5a00ee2";
    sha256 = "sha256-OsFilj/vFqg0eewAps3luKjpdRvg8pIf5dHJBdZatsg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
