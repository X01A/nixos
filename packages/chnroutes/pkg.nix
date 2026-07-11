{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4ef061d336abd717497daf9c7ebe5dd64de2f8bb";
    sha256 = "sha256-9VaI+kAUiP7NilDwE1u9cu9YMnyW+RTggQdcIeI2KiI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
