{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f1cb2e12dbca6e66ce069dbafff673d1a2649b7b";
    sha256 = "sha256-gjibFwOvvbbRPNQ7fRvNkjpjT0VtBpjCbV3YgOawdGI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
