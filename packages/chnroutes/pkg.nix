{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b89aec47acbeb1a4427bfc6661fe98e0c19f3c70";
    sha256 = "sha256-7BXdxU5PuV8eSaSENBsfSWlxYbhLMDo9PcOwSuKXpfA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
