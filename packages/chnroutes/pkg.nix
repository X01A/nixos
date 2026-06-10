{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7e799b6b3970f822618460f57b0e8498dc225de5";
    sha256 = "sha256-zzBYll6MaIH+uqnmUJNkI9n2WMhgKM/E/bUvfaFvBxY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
