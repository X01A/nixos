{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2f4308545ccd2426653d4bff6228b7769df7f3d3";
    sha256 = "sha256-gUch3YweVicoHwlRztQhWKXR7pzWouZgsvvGAcogAcE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
