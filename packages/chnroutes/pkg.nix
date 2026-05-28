{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1d77ad3631d905e1b94ff191c53d40965324a34a";
    sha256 = "sha256-ryzdZxhhqq0+bBOgxoT/dNiycWSdgQnHb/fIQw4eawo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
