{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1fd8a50dc652ea670ce63f548d4cd0b633a5f234";
    sha256 = "sha256-jS3rN8bS00hJr0/Aiz/a+vBL68o9HJ2KV33q2EA7jA0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
