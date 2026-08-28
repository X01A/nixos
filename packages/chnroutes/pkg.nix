{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "10dcde11e256b786757858c21ec2c41ad535be48";
    sha256 = "sha256-7nGzq5nocyJB4rVoglkaAtkc+QIEX3iITmfy8Zvl4Aw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
