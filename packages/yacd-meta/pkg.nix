{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-29";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2d0c52cecf9ee7ed8446d2fa240291ef83facbde";
    fetchSubmodules = true;
    sha256 = "sha256-Pi1LV+DnBiFqcelPz/F6Ip2wH+GC87vE+9H4nCaWlBU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
