{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-11";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "4aec92516ac81c754bd8e816fe045c7023b79b3a";
    fetchSubmodules = true;
    sha256 = "sha256-Ppxj6smtURzDw55b/s81fxOCaixEDsz5XE7ogL6oIRI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
