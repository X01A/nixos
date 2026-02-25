{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "563bb6cedfe965bb52aff2f026cb1a852a4acc01";
    sha256 = "sha256-1iyVDrkH/ZTIvx0g+sYs3sTM9AURMA5F62TLOW+MW0I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
