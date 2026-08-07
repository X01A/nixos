{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5cb838f5e011c4e695d0bec68f4cc60292204c29";
    sha256 = "sha256-+ecLeGdyXH6+PViocc/av+d4qeRC+RH9XR+a7bzT8FI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
