{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b928dd6575dcd9388ece6326175856050ca02424";
    sha256 = "sha256-L3jR+67SBby42Pv5pdG0rLviBEDanOj0NJqA8SLqFJ0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
