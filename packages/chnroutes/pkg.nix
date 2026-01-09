{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e755f19b812a47aa4ba35d36b2ab511dc5116442";
    sha256 = "sha256-E9WHisx9fQvon/rl6mFf1JVfu3r/pENwLX4xHDUWc0g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
