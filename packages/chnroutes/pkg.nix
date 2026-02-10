{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "526a9f4a08deee674c7148204775a39f45295e45";
    sha256 = "sha256-K5mMLy6eqNCV8MDEgENunscihH9QuTzVrESwgVOpPj8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
