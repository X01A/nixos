{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "336bc1433937a00d15b22eddf5bf9fd005c56420";
    sha256 = "sha256-6S4wOfmD+tdm97ahGmK5t/UQCkSnEmtnuKmP26BZFM4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
