{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-09";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ffd713744972445777681b2c705faaeffbd13e37";
    fetchSubmodules = true;
    sha256 = "sha256-GaYhIlvKrdXdmh2URqDY5NmKHynwYc/xQb/oFAZvROM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
