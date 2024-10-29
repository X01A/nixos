{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "649fd699bfc12dcbad2b59df10ff945cd9eeca20";
    sha256 = "sha256-taHO18eVRbHBeEWkNpfilcDC2bsNEX9y0x1JjASrFa4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
