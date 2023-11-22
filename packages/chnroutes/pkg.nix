{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "df6b3de2323c461193c74939126b16867cfe7236";
    sha256 = "sha256-eumqchC3XJe7JtjsIor1/HxdxNistd6QsnoKFrDcizw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
