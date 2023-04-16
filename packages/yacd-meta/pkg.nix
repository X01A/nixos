{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-16";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "aa6b7ce767fdf74d537d3e1497a0041458e28949";
    fetchSubmodules = true;
    sha256 = "sha256-Vcfs8nrEPLENyr0Hf4m3JVmJcAwE3YW7f2CVdy8XZIw=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
