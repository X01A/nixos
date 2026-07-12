{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "66960c05b233f0297364953b8b9896be8c87c294";
    sha256 = "sha256-F5FgnfpQ19t7R2hK7+Gjcp4nQ7bFdMn3fmDhWrJ8I30=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
