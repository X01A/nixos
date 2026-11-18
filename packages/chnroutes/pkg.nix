{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c0c212915bdbbc80adb62f35e417723d2cdbc08d";
    sha256 = "sha256-JR1ugKWZwMBewSAnXcRkwpppMXfyYDUvaadPm0FIRws=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
