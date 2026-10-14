{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2e5e02328b37e2031782c2258905fb201328b12a";
    sha256 = "sha256-HDs14MoaY/Ef1fpgNtbxl3ZUjRzTO8XoW4S9RY9Ftqs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
