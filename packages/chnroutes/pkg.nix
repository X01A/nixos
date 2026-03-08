{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cf242528c4dc1aa2022ddce7c0fcf18832d67181";
    sha256 = "sha256-z3UZ7iOOTW72h0TX4So9WBQF5GdNJan3EuCpFmAlThk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
