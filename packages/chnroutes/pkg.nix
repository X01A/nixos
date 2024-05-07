{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "45b30ac3ab8b4372055bd9812593b18a52ec8e5c";
    sha256 = "sha256-JXPqStuzHLP9hauGq6ql7dL373L5yuptWqMvEOKOcJ8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
