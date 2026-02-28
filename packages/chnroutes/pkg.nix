{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3822cde971ef1959db00120617d8b39d6654674f";
    sha256 = "sha256-9RynMsp0vE5tjxONIAkL+7pXzzECkKlMdOaDAoCQHL8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
