{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "949fdb7933a81ab185899338d033c49cf58a78c0";
    sha256 = "sha256-KMI0UmHPONfnuQoxsl5RWq5ABxEd0DpLqAe3OJSV8t0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
