{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-15";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "1be34adfebcf638da7b7b1fb788e943b99f823a4";
    fetchSubmodules = true;
    sha256 = "sha256-Vcfs8nrEPLENyr0Hf4m3JVmJcAwE3YW7f2CVdy8XZIw=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
