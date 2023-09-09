{ fetchFromGitHub, buildGo120Module, lib }:

buildGo120Module rec {
  pname = "clash-meta";
  version = "unstable-2023-09-08";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "90acce7fa15884eabd8ee8f0783cdc26b9d1c6ab";
    fetchSubmodules = true;
    sha256 = "sha256-hB4jv4APFlccQw9cHK9r+Df9xP89O6KxcGL8HLt5CdU=";
  });


  tags = [
    "with_gvisor"
  ];
  ldflags = [
    "-s"
    "-w"
    "-X github.com/Dreamacro/clash/constant.Version=${version}"
  ];

  doCheck = false;
  excludedPackages = [ "./test" ];
  vendorSha256 = "sha256-IdNhPkpPADlgydC9hHjl7LIaKPbM58H5orwzS0F2ALE=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

