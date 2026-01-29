{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7bde86abd05672ef2f2cc07723c69f936bda94de";
    sha256 = "sha256-z8SR63lwVjlySCFYOc14qNgIgsKLby3lXbG3ys0FCyU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
