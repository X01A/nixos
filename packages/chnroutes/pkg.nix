{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "70d4a40c666cfe15759c3a224c1d33e919568307";
    sha256 = "sha256-2uzanygp2UPLNfsGyH7cAwoIT5GW/t4PF/hGSRXgib4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
