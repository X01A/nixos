{ stdenv, fetchgit, ... }:

stdenv.mkDerivation rec {
  name = "microsocks";

  src = fetchgit {
    url = "https://github.com/rofl0r/microsocks.git";
    rev = "c4b927bd2f9f7444f65d64f93c356b79f1c6d3e8";
    sha256 = "bFbZgbaA429e5GFmrdm9vvXnCLG1jnNnI4CbM8wjTaA=";
    fetchSubmodules = true;
  };

  buildInputs = [ ];
  nativeBuildInputs = [ ];

  installPhase = ''
    mkdir -p $out/bin/
    install -m 755 microsocks -t $out/bin/
  '';
}
