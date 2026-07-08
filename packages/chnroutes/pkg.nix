{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "dd7f68bbd9eb090f65a1cf11aa10e4add0382269";
    sha256 = "sha256-dURGOIasVdcF/MrKGYnquMgEw1rMD8nYVoitWsuX7m8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
