{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ee1e05f746bb66228ab9ba8ccd178b8cccfc8cf2";
    sha256 = "sha256-D+7BB8r3eE9jITFsSYZy68SML/3ZqZEJ0/L6K3kisVw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
