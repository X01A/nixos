{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7a71c3234a0ed509b008c41bd1dc59d91e298b4e";
    sha256 = "sha256-XtX4g9xxmnp/jkQVx6sRyFvByTakoMovj3BkL49lnKw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
