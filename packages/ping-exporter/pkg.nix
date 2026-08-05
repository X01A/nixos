{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ping-exporter";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "czerwonk";
    repo = "ping_exporter";
    # Upstream prefixed release tags with "v" starting in 1.2.0.
    rev = if lib.versionAtLeast version "1.2.0" then "v${version}" else version;
    hash = "sha256-YbdODBKXvBNtIt+Hqu/xA52p5TZGhcVbqZfTcmyyV+Y=";
  };

  vendorHash = "sha256-mZ29jH1572VDLOJb/x3FCI2Q6xVjJ3Ghy/ay343kA3Y=";

  meta = with lib; {
    description = "Prometheus exporter for ICMP echo requests";
    homepage = "https://github.com/czerwonk/ping_exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ nudelsalat ];
  };
}
