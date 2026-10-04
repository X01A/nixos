{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ping-exporter";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "czerwonk";
    repo = "ping_exporter";
    # Upstream prefixed release tags with "v" starting in 1.2.0.
    rev = if lib.versionAtLeast version "1.2.0" then "v${version}" else version;
    hash = "sha256-faMYFo6QdiyLZ5v7BcsIakQ0SD4r6Jb2VQvGuWzjrmI=";
  };

  vendorHash = "sha256-xO+86cajEkPj2+6DtShbPjspDmpb1egm76ok/2V0NMM=";

  meta = with lib; {
    description = "Prometheus exporter for ICMP echo requests";
    homepage = "https://github.com/czerwonk/ping_exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ nudelsalat ];
  };
}
