{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3a98673776ce5e5edbe1d6c92d707b0663d83787";
    sha256 = "sha256-ZW+UBUNUWkYZe28rHbbunL3TLM+oh8q8g952SYkGztA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
