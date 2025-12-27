{
  stdenv,
  fetchFromGitHub,
  jre8,
  unzip,
}:

stdenv.mkDerivation rec {
  pname = "novnc";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "novnc";
    repo = "noVNC";
    rev = "60c7518f8c32704615b4953bae28783786817cdc";
    sha256 = "0llag553aw0marb9p59rb14prjqwknvyrjwqvgakf4mxsk0l2nqy";
  };

  phases = "installPhase";
  installPhase = ''
    mkdir -p $out
    cp -rv $src/* $out
  '';
}
