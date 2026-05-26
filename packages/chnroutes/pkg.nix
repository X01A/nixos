{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e00b7be3c11e8d7fa02574cd7db27612c090ea6e";
    sha256 = "sha256-n3hL4gXC4P4MBMZSmOoleQfwm0MwVXvXdYIWCj8EPaQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
