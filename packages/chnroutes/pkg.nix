{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ae5282ebb331703313302e7e896b840c461d6323";
    sha256 = "sha256-Il4/dIDj4VXUPk2RJ503NsmdNhX6TLMkk+mz3p4L9Gw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
