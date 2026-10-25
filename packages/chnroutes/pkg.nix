{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "aab238efc873742551cb7b95bb89fc3934c5dd6f";
    sha256 = "sha256-NoL8RTVC5c5K8NkbBKCZb23RHP1T7AnsGDiNxTYw1g8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
