{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2025-12-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "913f599a8a23919c8b4af2e02de0f4170647715d";
    sha256 = "sha256-CndGCvfUF+EZ1jdDBOVPEGA1osE6lkOlDjmBC6c+tG8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
