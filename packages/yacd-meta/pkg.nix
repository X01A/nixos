{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-29";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ddfe4f28c1f0c9c288888441823e63cd22d9e1fb";
    fetchSubmodules = true;
    sha256 = "sha256-Pi1LV+DnBiFqcelPz/F6Ip2wH+GC87vE+9H4nCaWlBU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
