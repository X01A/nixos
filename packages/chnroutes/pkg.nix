{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "528823f6b4a914fdfb5f00cf94cd904f6550be4c";
    sha256 = "sha256-j2J9CYeC6UXOPgFjUgWBDaOmt7DWsQ7wgwJg43+9vOI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
