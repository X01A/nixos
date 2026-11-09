{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b587389740ee816df959038e99440f1ad9cbccdc";
    sha256 = "sha256-4kXbQf5VAHm0sWqM3yT/lnfXfChDtzEaT8Y+HOy8xMM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
