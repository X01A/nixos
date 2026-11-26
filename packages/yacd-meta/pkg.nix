{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.8.0-unstable-2026-11-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "f5c9009b2bb3af536be6f6c0cf9e91d96c95210c";
    fetchSubmodules = true;
    sha256 = "sha256-3IuFqd+0KvEmc3/LjjuNHnISJodugcramTHiNwXMfEk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
