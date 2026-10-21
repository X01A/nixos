{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "75471d73fd69ae367dd77c166bff88462a5c0c95";
    sha256 = "sha256-tfdqH4/TZHHtjxd0gqyMd4/MRKQgYupmzhj2P/XHx8s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
