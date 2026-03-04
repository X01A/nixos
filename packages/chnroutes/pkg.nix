{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6a24f4548d0cde3840a2e6acb991a4f58ee62e10";
    sha256 = "sha256-Equv6g6/Iny5H9NNPZ4N+z/O1XsPSIGWpw2I1FMkO5Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
