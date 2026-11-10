{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3fbfa732cbbb95e572480ab2abeeebd1b30bf3af";
    sha256 = "sha256-cjvfyOyHMWOvjIFCo+zk6N+mH3L8fZvWAL7gDlM+FYk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
