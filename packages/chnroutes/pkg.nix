{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "204214bd3bc6417c3ca7aa7a72165e830b5465f2";
    sha256 = "sha256-rdyfn1F6kgyElPb5pC5klYDon7dXgk1FtHtyXwo5Hzw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
