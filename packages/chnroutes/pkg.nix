{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "760620bbcf97c02868fa3c27bc4d4da60760f481";
    sha256 = "sha256-Fm+MtlH6e5wgMy0Cj+eAXNlHlEWBV/EbB8d/A/gsAB8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
