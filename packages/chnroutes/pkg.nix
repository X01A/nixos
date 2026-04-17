{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "99cdd3c92653a3ed6e9818cf0e9b3ca1848007e5";
    sha256 = "sha256-oiVcRN8uAkZUd15jbNM5RGTC8ZBhF9on0tsEdOCGvMQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
