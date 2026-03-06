{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2c978b1b07b0c266b5a5032756319f5ae9085dd2";
    sha256 = "sha256-MDMbouJC0VVmJepza09q77qrwE2OMLLv0Mn+pDDgwxc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
