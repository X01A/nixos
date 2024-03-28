{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ping-exporter";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "czerwonk";
    repo = "ping_exporter";
    rev = version;
    hash = "sha256-BGHBpS7iJogMKXNk9ogSL7DB11LyNtSxdEPD356702Q=";
  };

  vendorHash = "sha256-1oNbg6lu9xLJKeYOzK23HOTLJc3KWri7z4/2AZ7Hzms=";

  meta = with lib; {
    description = "Prometheus exporter for ICMP echo requests";
    homepage = "https://github.com/czerwonk/ping_exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ nudelsalat ];
  };
}
