{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "de9f9761bf1fb7e5eae6631f7e8c26bbf4f124e4";
    sha256 = "sha256-1wykdimJgMrDLQF0aWH1TXq2WcaiLhU20qSiXUNMQKk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
