{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d919e7d69b965193d7e0e94de6a349f0cdb0e585";
    sha256 = "sha256-pNdUaUajqe9hKvMkLHLsVmMSDL8fdaiKCw3qZZADB3c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
