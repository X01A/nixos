{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "de20e78d6f146cc8cb9926a144397d410bcd2f67";
    sha256 = "sha256-TAdzYTRlHJfwGcw7Wjcl6vuH+do1Rjp4tHTWGqILzng=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
