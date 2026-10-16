{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "57e6825d6f0677a661bd548206f0b74bbf707027";
    sha256 = "sha256-inXSKIv/AdwqLIqr3NtWKevcgVhpLTBAGE/PmX2JrAI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
