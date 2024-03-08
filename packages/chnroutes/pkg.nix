{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3c69138bcde5723837a0a5fff69606ab0f80104a";
    sha256 = "sha256-U9inl+/aOgs8700snXTScTqPw5XdIHuHuY/cg5p7eFE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
