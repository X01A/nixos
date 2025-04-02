{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "23a42294453f9a6818b9e61a4be888f2b77b4fcc";
    sha256 = "sha256-2gqQOpu0WpicVaqxg92mEuA/x463KgpyaKwGtHVE7yg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
