{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "79af7fc00a05e1981ed63742300b1fe2488d691a";
    sha256 = "sha256-UNh4tDnQcNH761wyvNTuwLXyNqvGdqUVAsJ6qIgVXKY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
