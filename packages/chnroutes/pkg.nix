{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b7733ff6863757c82fc1cfb4cc7b6d869e6a9da2";
    sha256 = "sha256-2/ap6JqMjUlUIIASrFekoyY5qwRgzG/cdsKXaDeUQOw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
