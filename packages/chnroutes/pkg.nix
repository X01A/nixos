{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8741c7f778230703bc8f73fbd4dffde9fc65630a";
    sha256 = "sha256-RhDZQXePb5fc4qoYYum7DT8Wq+7nKUIhKnjQPOZS/2w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
