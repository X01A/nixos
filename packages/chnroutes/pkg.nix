{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3080a44daa99578077d5394fd74ca9dc8abad90d";
    sha256 = "sha256-H7dMcXXrLUNm+TjVN+Xwbc7YHNogZ6WFYTCH8I8c+p4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
