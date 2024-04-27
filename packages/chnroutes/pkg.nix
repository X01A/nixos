{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8912e3d36847aa0aa763beeb071ecac02e8abc24";
    sha256 = "sha256-BroLn76/25jlZDC9L8VISLNZsxmd6KoxgdzDIRNPFWk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
