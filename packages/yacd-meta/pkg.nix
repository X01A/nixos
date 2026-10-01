{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.6.0-unstable-2026-09-30";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c70d55a0ba14efe6fc382966d47a035d5fd14faf";
    fetchSubmodules = true;
    sha256 = "sha256-IX/eJ6g7BsDt5QCdlZfIUhKpVoYSO1jhL7SE8QTs2uI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
