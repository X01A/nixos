{ fetchFromGitHub, buildGo120Module, lib }:

buildGo120Module rec {
  pname = "clash-meta";
  version = "unstable-2023-05-01";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "30d3c2a68b425223b4400c686f51fc782dfac4fa";
    fetchSubmodules = true;
    sha256 = "sha256-zI0zdfZyvYsEFIgoW3CkWzXgzTNIUQsdFG66vGFrv6Q=";
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
  vendorSha256 = "sha256-eV3gF1uOGnor4kWh+Ax4OdeI4oXWXSFsK/iwA262qeU=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

