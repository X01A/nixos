{
  lib,
  buildGo127Module,
  fetchFromGitHub,
}:

# ping_exporter 1.3.1 raised its go.mod directive to `go 1.26.10`, newer than
# nixpkgs' default Go, and buildGoModule sets GOTOOLCHAIN=local so it cannot
# fetch a newer one itself. Build with a toolchain that satisfies the directive
# again; drop this back to buildGoModule once nixpkgs' Go catches up.
buildGo127Module rec {
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
