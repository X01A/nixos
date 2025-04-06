{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "98aa1cba2f96743a2490686ec2c1d435b1a930c9";
    sha256 = "sha256-5OAN1nUDss8Ze5wLFBe1F5NIRXS5Je5GsVvWA+hlgDk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
