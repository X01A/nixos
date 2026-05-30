{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3094a29461b846186f45764ab1291811e8e05416";
    sha256 = "sha256-ep5S7ut1hcasqE7nTxBKB69Lna0Ynd4A4BWjdS4uozs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
